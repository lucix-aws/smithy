$version: "2.0"

namespace aws.protocoltests.corpus

use smithy.protocols#rpcv2Json
use smithy.test#InitialHttpRequest
use smithy.test#eventStreamTests
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// rpcv2Json edge cases — the tagged (non-baseline) topics.
//
// HAND-WRITTEN. Unlike the other tests-rpcv2json-* files, this one is NOT
// produced by .gen-rpcv2json.py, because these cases are either
// protocol-specific (rpcv2Json resolves errors from `__type` alone, and its
// request envelope differs) or carry values whose wire form has no awsJson
// counterpart. The generator must not overwrite it. `apply` merges protocol
// test traits, so these cases coexist with the generated ones on the same
// operations.
//
// Tagged cases are deliberately exempt from the base case rules: each one
// isolates a single edge rather than exhaustively populating its shape.
// =============================================================================

// =============================================================================
// arbitrary-precision — bigInteger / bigDecimal
//
// Its own tagged case, not the untagged baseline, so a consumer whose codegen
// lacks arbitrary-precision support can filter it out by tag rather than
// patching the model. (This was previously unwritable for Go because the SDK's
// corpus projection stripped bignum members with excludeShapesBySelector; that
// transform is gone now that smithy-go supports bignums.)
// =============================================================================

apply ScalarMembers @httpRequestTests([
    {
        id: "RpcV2JsonScalarMembersArbitraryPrecision",
        documentation: """
            Serializes integers and decimals too large for int64/float64 as JSON
            STRINGS, which is how this protocol keeps arbitrary precision intact
            (a JSON number would be routed through a double by many parsers)""",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/ScalarMembers",
        body: """
            {
                "bigIntegerMember": "1234567890123456789012345678901234567890",
                "bigDecimalMember": "3.141592653589793238462643383279502884197"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        params: {
            bigIntegerMember: 1234567890123456789012345678901234567890,
            bigDecimalMember: 3.141592653589793238462643383279502884197,
        },
        tags: ["arbitrary-precision"]
    },
])

apply ScalarMembers @httpResponseTests([
    {
        id: "RpcV2JsonScalarMembersArbitraryPrecisionDeserialize",
        documentation: "Deserializes arbitrary-precision numbers without losing digits",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "bigIntegerMember": "1234567890123456789012345678901234567890",
                "bigDecimalMember": "3.141592653589793238462643383279502884197"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            bigIntegerMember: 1234567890123456789012345678901234567890,
            bigDecimalMember: 3.141592653589793238462643383279502884197,
        },
        tags: ["arbitrary-precision"]
    },
])

// =============================================================================
// numeric-boundaries — type minima/maxima, negatives, and a long past 2^53
//
// The 2^53 boundary matters because a JSON number is a double in many
// languages: a long above it cannot round-trip through a float64.
// =============================================================================

apply ScalarMembers @httpRequestTests([
    {
        id: "RpcV2JsonScalarMembersNumericMinima",
        documentation: "Serializes the minimum value of each integral type, including negatives",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/ScalarMembers",
        body: """
            {
                "byteMember": -128,
                "shortMember": -32768,
                "integerMember": -2147483648,
                "longMember": -9007199254740993
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        params: {
            byteMember: -128,
            shortMember: -32768,
            integerMember: -2147483648,
            longMember: -9007199254740993,
        },
        tags: ["numeric-boundaries"]
    },
    {
        id: "RpcV2JsonScalarMembersNumericMaxima",
        documentation: """
            Serializes the maximum value of each integral type, plus a long above
            2^53 and a double at full 17-significant-digit precision""",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/ScalarMembers",
        body: """
            {
                "byteMember": 127,
                "shortMember": 32767,
                "integerMember": 2147483647,
                "longMember": 9007199254740993,
                "doubleMember": 123456789.12345679
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        params: {
            byteMember: 127,
            shortMember: 32767,
            integerMember: 2147483647,
            longMember: 9007199254740993,
            doubleMember: 123456789.12345679,
        },
        tags: ["numeric-boundaries"]
    },
])

apply ScalarMembers @httpResponseTests([
    {
        id: "RpcV2JsonScalarMembersNumericMinimaDeserialize",
        documentation: "Deserializes the minimum value of each integral type, including negatives",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "byteMember": -128,
                "shortMember": -32768,
                "integerMember": -2147483648,
                "longMember": -9007199254740993
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            byteMember: -128,
            shortMember: -32768,
            integerMember: -2147483648,
            longMember: -9007199254740993,
        },
        tags: ["numeric-boundaries"]
    },
    {
        id: "RpcV2JsonScalarMembersNumericMaximaDeserialize",
        documentation: "Deserializes maxima, a long above 2^53, and a full-precision double",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "byteMember": 127,
                "shortMember": 32767,
                "integerMember": 2147483647,
                "longMember": 9007199254740993,
                "doubleMember": 123456789.12345679
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            byteMember: 127,
            shortMember: 32767,
            integerMember: 2147483647,
            longMember: 9007199254740993,
            doubleMember: 123456789.12345679,
        },
        tags: ["numeric-boundaries"]
    },
])

// =============================================================================
// string-escaping — quote, backslash, control characters, non-BMP
//
// JSON requires the quote, the backslash and the C0 control range to be
// escaped; everything above the BMP has to survive as a surrogate pair in
// UTF-16 languages.
// =============================================================================

apply ScalarMembers @httpRequestTests([
    {
        id: "RpcV2JsonScalarMembersStringEscaping",
        documentation: "Escapes quotes, backslashes, control characters and preserves non-BMP text",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/ScalarMembers",
        body: """
            {
                "stringMember": "quote \\" backslash \\\\ newline \\n tab \\t control \\u0001 astral \\ud83d\\ude00"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        params: {
            stringMember: "quote \" backslash \\ newline \n tab \t control \u0001 astral \ud83d\ude00",
        },
        tags: ["string-escaping"]
    },
])

apply ScalarMembers @httpResponseTests([
    {
        id: "RpcV2JsonScalarMembersStringEscapingDeserialize",
        documentation: "Unescapes quotes, backslashes, control characters and non-BMP text",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "stringMember": "quote \\" backslash \\\\ newline \\n tab \\t control \\u0001 astral \\ud83d\\ude00"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            stringMember: "quote \" backslash \\ newline \n tab \t control \u0001 astral \ud83d\ude00",
        },
        tags: ["string-escaping"]
    },
])

// =============================================================================
// blob-encoding — base64 padding variants
//
// A blob whose length is not a multiple of 3 produces padding: one input byte
// yields two '=' characters, two input bytes yield one. The corpus baseline
// only ever uses 3-byte values, which are the one case that needs no padding.
// =============================================================================

apply ScalarMembers @httpRequestTests([
    {
        id: "RpcV2JsonScalarMembersBlobPaddingOneByte",
        documentation: "Base64-encodes a one-byte blob, which requires two padding characters",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/ScalarMembers",
        body: """
            {
                "blobMember": "Zg=="
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        params: {
            blobMember: "f",
        },
        tags: ["blob-encoding"]
    },
    {
        id: "RpcV2JsonScalarMembersBlobPaddingTwoBytes",
        documentation: "Base64-encodes a two-byte blob, which requires one padding character",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/ScalarMembers",
        body: """
            {
                "blobMember": "Zm8="
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        params: {
            blobMember: "fo",
        },
        tags: ["blob-encoding"]
    },
])

apply ScalarMembers @httpResponseTests([
    {
        id: "RpcV2JsonScalarMembersBlobPaddingOneByteDeserialize",
        documentation: "Decodes a base64 blob with two padding characters",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "blobMember": "Zg=="
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            blobMember: "f",
        },
        tags: ["blob-encoding"]
    },
    {
        id: "RpcV2JsonScalarMembersBlobPaddingTwoBytesDeserialize",
        documentation: "Decodes a base64 blob with one padding character",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "blobMember": "Zm8="
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            blobMember: "fo",
        },
        tags: ["blob-encoding"]
    },
])

// =============================================================================
// timestamp-fractional-seconds
//
// rpcv2Json ignores @timestampFormat and always writes epoch-seconds "as a
// double", so sub-second precision arrives as the fractional part of a JSON
// number rather than as digits in a date-time string. That makes this a
// protocol-level concern here, not a formatting edge.
//
// NOTE on the sibling tag: `timestamp-offset` is NOT APPLICABLE to rpcv2Json.
// It asserts that a client normalizes an RFC-3339 UTC offset, which only
// exists in a date-time STRING. rpcv2Json never puts a timestamp on the wire
// as a string and has no HTTP bindings to carry one, so there is no offset to
// normalize. It stays uncovered here by design, not by omission.
// =============================================================================

apply ScalarMembers @httpResponseTests([
    {
        id: "RpcV2JsonScalarMembersFractionalSecondsDeserialize",
        documentation: "Preserves sub-second precision carried in the fraction of an epoch-seconds number",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "epochSecondsMember": 1609502096.123
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            epochSecondsMember: 1609502096.123,
        },
        appliesTo: "client",
        tags: ["timestamp-fractional-seconds"]
    },
])

// =============================================================================
// error-discrimination — rpcv2Json resolves the error shape from `__type` ONLY
//
// This is deliberately NARROWER than the awsJson/restJson cascade (header,
// then __type, then code). The spec is explicit on all three points asserted
// below: responses SHOULD NOT carry X-Amzn-ErrorType and "Clients MUST ignore
// this header"; "The Code response body field and code response body field
// MUST NOT be used to distinguish which error is contained in a response"; and
// a union deserializer "MUST ignore an unrecognized __type member if present".
// =============================================================================

apply HttpErrorGone @httpResponseTests([
    {
        id: "RpcV2JsonErrorIgnoresErrorTypeHeader",
        documentation: """
            Resolves the error from the body's __type even when an
            X-Amzn-ErrorType header names a different shape, because clients
            MUST ignore that header under this protocol""",
        protocol: rpcv2Json,
        code: 410,
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorGone",
                "message": "resource was deleted",
                "details": "deleted on 2021-01-01"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "X-Amzn-ErrorType": "aws.protocoltests.corpus#HttpErrorConflict",
        },
        params: {
            message: "resource was deleted",
            details: "deleted on 2021-01-01",
        },
        appliesTo: "client",
        tags: ["error-discrimination"]
    },
    {
        id: "RpcV2JsonErrorIgnoresCodeBodyField",
        documentation: """
            Resolves the error from __type even when Code and code body fields
            name a different shape, because they MUST NOT be used to
            distinguish which error is contained""",
        protocol: rpcv2Json,
        code: 410,
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorGone",
                "Code": "HttpErrorConflict",
                "code": "HttpErrorServiceUnavailable",
                "message": "resource was deleted",
                "details": "deleted on 2021-01-01"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            message: "resource was deleted",
            details: "deleted on 2021-01-01",
        },
        appliesTo: "client",
        tags: ["error-discrimination"]
    },
])

// A union carrying a stray __type sibling: the spec requires deserializers to
// ignore an unrecognized __type on a union rather than treating it as a
// variant or failing.
apply UnionOfScalars @httpResponseTests([
    {
        id: "RpcV2JsonUnionIgnoresUnrecognizedTypeMember",
        documentation: "Ignores an unrecognized __type member alongside a union variant",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "value": {
                    "__type": "aws.protocoltests.corpus#NotARealShape",
                    "stringValue": "union string"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            value: {
                stringValue: "union string",
            },
        },
        appliesTo: "client",
        tags: ["unknown-fields", "error-discrimination"]
    },
])

// =============================================================================
// Request envelope: event streaming media types
//
// The generated event stream cases assert framing and the initial response, but
// not the request envelope. rpcv2Json distinguishes the two directions: a
// streaming REQUEST body is application/vnd.amazon.eventstream, while Accept
// reflects whether the RESPONSE streams. Asserted through initialRequest, which
// describes the HTTP request of an event stream operation.
// =============================================================================

apply EventStreamRequest @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamRequestEnvelope"
        documentation: """
            A streaming request body uses the event stream media type, while
            Accept stays application/json because this operation's response is
            a buffered RPC response"""
        protocol: rpcv2Json
        initialRequest: {
            method: "POST"
            uri: "/service/RpcV2JsonCorpusTests/operation/EventStreamRequest"
            headers: {
                "smithy-protocol": "rpc-v2-json"
                "Content-Type": "application/vnd.amazon.eventstream"
                "Accept": "application/json"
            }
        }
        initialRequestShape: InitialHttpRequest
    }
])

apply EventStreamResponse @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamResponseEnvelope"
        documentation: """
            A buffered request that expects a streaming response sets Accept to
            the event stream media type while its own Content-Type stays
            application/json"""
        protocol: rpcv2Json
        initialRequest: {
            method: "POST"
            uri: "/service/RpcV2JsonCorpusTests/operation/EventStreamResponse"
            headers: {
                "smithy-protocol": "rpc-v2-json"
                "Content-Type": "application/json"
                "Accept": "application/vnd.amazon.eventstream"
            }
        }
        initialRequestShape: InitialHttpRequest
    }
])

// =============================================================================
// Server cases for the Unit-input body rules
//
// The corpus's only other server-side coverage is nil, so these are the first
// `appliesTo: "server"` cases in it. They exist because the rule they assert is
// asymmetric: a CLIENT targeting the Unit shape MUST send no body and no
// Content-Type (the generated NoInputOutput case covers that), but a SERVER
// MUST tolerate a peer that sends `{}` or an empty body anyway. Ported from
// upstream's own rpcv2Json empty-input-output suite.
// =============================================================================

apply NoInputOutput @httpRequestTests([
    {
        id: "RpcV2JsonNoInputServerAllowsEmptyJsonObject",
        documentation: "Servers should accept an empty JSON object for an operation with no input",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoInputOutput",
        body: "{}",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        appliesTo: "server",
    },
    {
        id: "RpcV2JsonNoInputServerAllowsEmptyBody",
        documentation: """
            Servers should accept an empty body for an operation with no input,
            and must not fail merely because Accept is set""",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoInputOutput",
        body: "",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        appliesTo: "server",
    },
])

// unknown-enum — NOT EXPRESSIBLE, and this is a strategy problem, not an omission
//
// The tag wants a response carrying an enum value the model does not declare,
// so a client compiled against an older model has to carry it through rather
// than fail or blank it. That cannot be written as a protocol test case: the
// `params` of a case are validated by NodeValidationVisitor against the target
// shape, and an undeclared value on an enum member is a hard ERROR --
//
//   smithy.test#httpResponseTests.N.params.stringEnum: String value provided
//   for CorpusStringEnum must be one of the following values: Bar, Baz, Foo
//
// (verified by writing the case and building). Suppressing it would mean
// suppressing HttpResponseTestsOutput for the whole operation, which would also
// hide genuine param errors in every other case on it.
//
// Options, all needing a decision rather than a case:
//   1. Add an open string member to the corpus alongside the enum member and
//      assert the wire value through that -- a shape change to the frozen corpus.
//   2. Accept that this behavior is only testable outside the protocol test
//      traits, and drop the tag from the vocabulary.
// Until then `unknown-enum` has zero cases in ANY protocol for a structural
// reason, and the vocabulary overstates coverage by listing it.
// =============================================================================
