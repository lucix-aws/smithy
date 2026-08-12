#!/usr/bin/env python3
"""
Transform the corpus's awsJson1_0 test-case files into rpcv2Json ones.

Not a pure sed like the J10->J11 mirror: rpcv2Json differs from awsJson on the
request envelope (URI carries service+operation, no X-Amz-Target, a
smithy-protocol header, Accept) and on timestamps (@timestampFormat MUST NOT be
respected, so every timestamp is epoch-seconds). Bodies otherwise carry over
unchanged because rpcv2Json ignores @jsonName exactly like awsJson does --
confirmed against both the protocol spec's supported-traits table and the
accepted SEP, neither of which lists jsonName.
"""
import re
import sys
import pathlib

SERVICE = "RpcV2JsonCorpusTests"
# 2021-01-01T00:00:00Z == Fri, 01 Jan 2021 00:00:00 GMT
EPOCH = "1609459200"

REQ_HEADERS_OLD = re.compile(
    r'        headers: \{\n'
    r'            "Content-Type": "application/x-amz-json-1\.0",\n'
    r'            "X-Amz-Target": "RpcV2JsonCorpusTests\.\w+",\n'
    r'        \},'
)
REQ_HEADERS_NEW = '''        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],'''

RESP_HEADERS_OLD = '''        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },'''
RESP_HEADERS_NEW = '''        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },'''

# eventStreamTests initialResponse block (different indent, no trailing comma).
# An event streaming response is framed, so its Content-Type is the event
# stream media type rather than the JSON one.
ES_HEADERS_OLD = '''            headers: {
                "Content-Type": "application/x-amz-json-1.0"
            }'''
ES_HEADERS_NEW = '''            headers: {
                "smithy-protocol": "rpc-v2-json"
                "Content-Type": "application/vnd.amazon.eventstream"
            }'''

APPLY = re.compile(r'^apply (\w+) @(\w+)\(\[', re.M)


def transform(text: str) -> str:
    text = text.replace("use aws.protocols#awsJson1_0", "use smithy.protocols#rpcv2Json")
    text = text.replace("protocol: awsJson1_0", "protocol: rpcv2Json")
    text = text.replace("AwsJson10", "RpcV2Json")

    # @timestampFormat is not respected: every timestamp is epoch-seconds.
    text = re.sub(r'("dateTimeMember":\s*)"2021-01-01T00:00:00Z"', r'\g<1>' + EPOCH, text)
    text = re.sub(r'("httpDateMember":\s*)"Fri, 01 Jan 2021 00:00:00 GMT"', r'\g<1>' + EPOCH, text)

    # Prose that is specific to awsJson's envelope and would read wrong here.
    text = text.replace(
        """            Operations prepend a static prefix to the endpoint host when they
            carry the @endpoint trait. The path is unaffected: awsJson always
            POSTs to /, so the prefix is observable only on the host.""",
        """            Operations prepend a static prefix to the endpoint host when they
            carry the @endpoint trait. Only the host is affected: the request
            path still addresses the service and operation as usual.""")
    # Every remaining mention refers to the protocol under test.
    text = text.replace("awsJson1_0", "rpcv2Json").replace("awsJson", "rpcv2Json")

    text = REQ_HEADERS_OLD.sub(lambda m: REQ_HEADERS_NEW, text)
    text = text.replace(RESP_HEADERS_OLD, RESP_HEADERS_NEW)
    text = text.replace(ES_HEADERS_OLD, ES_HEADERS_NEW)

    # uri is per-operation: /service/{serviceName}/operation/{operationName}.
    # Split on apply statements so each segment knows its own operation.
    bounds = [m.start() for m in APPLY.finditer(text)] + [len(text)]
    out = [text[: bounds[0]]] if bounds and bounds[0] > 0 else []
    for i in range(len(bounds) - 1):
        seg = text[bounds[i]: bounds[i + 1]]
        m = APPLY.match(seg)
        shape = m.group(1)
        seg = seg.replace('uri: "/",', f'uri: "/service/{SERVICE}/operation/{shape}",')
        out.append(seg)
    return "".join(out)


def fix_no_input(text: str) -> str:
    """NoInputOutput targets the Unit shape, so rpcv2Json sends no body at all
    and MUST NOT set Content-Type (unlike EmptyInputOutput, whose input is an
    empty structure and therefore serializes as {})."""
    old = '''        id: "RpcV2JsonNoInputOutputSerialize",
        documentation: "Serializes operation with no input as empty JSON object",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoInputOutput",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],'''
    new = '''        id: "RpcV2JsonNoInputOutputSerialize",
        documentation: """
            Sends no body at all for an operation whose input targets the Unit
            shape, and omits Content-Type accordingly""",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoInputOutput",
        body: "",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Accept": "application/json",
        },
        forbidHeaders: [
            "Content-Type",
            "X-Amz-Target",
        ],'''
    if old not in text:
        print("  WARN: NoInputOutput request case not matched", file=sys.stderr)
        return text
    return text.replace(old, new, 1)


def main():
    d = pathlib.Path("/Users/lucix/git/smithy/smithy-aws-protocol-tests/model/corpus")
    layers = ["core", "defaults", "document", "httperror", "notraits", "miscserde", "eventstream"]
    for layer in layers:
        src = d / f"tests-awsjson10-{layer}.smithy"
        dst = d / f"tests-rpcv2json-{layer}.smithy"
        text = transform(src.read_text())
        if layer == "core":
            text = fix_no_input(text)
        dst.write_text(text)
        n = text.count("id: ")
        print(f"  {dst.name:38} {n:3} cases")
        leftovers = []
        if "x-amz-json" in text:
            leftovers.append("x-amz-json")
        if "X-Amz-Target\":" in text:
            leftovers.append("X-Amz-Target value")
        if 'uri: "/",' in text:
            leftovers.append('bare uri "/"')
        if "awsJson" in text:
            leftovers.append("awsJson reference")
        if leftovers:
            print(f"    *** LEFTOVERS: {leftovers}", file=sys.stderr)


if __name__ == "__main__":
    main()
