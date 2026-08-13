$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocoltests.config#ErrorCodeParams
use smithy.protocols#rpcv2Json
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// RpcV2JsonQueryCompatCorpusTests — @awsQueryCompatible + @awsQueryError
//
// Two wire effects, one per direction:
//   request  — the client MUST send x-amzn-query-mode: true
//   response — error responses carry x-amzn-query-error: "Code;Fault", where
//              Code comes from @awsQueryError and Fault is Sender (a @error
//              "client") or Receiver (a @error "server")
//
// Note on status codes: @awsQueryError's httpResponseCode is NOT applied under
// this protocol. It describes what awsQuery itself would have returned, and
// awsQueryCompatible exists so a service can migrate off awsQuery without
// dropping those values. The status therefore still comes from the @error
// trait, so QueryCompatCustomCodeError is 400 despite declaring 402. Upstream's
// rpcv2Cbor query-compatible suite asserts the same thing.
//
// HAND-WRITTEN: not produced by .gen-rpcv2json.py. These cases target a
// standalone service that the awsJson corpus files know nothing about.
// =============================================================================
apply QueryCompatErrorOp @httpRequestTests([
    {
        id: "RpcV2JsonQueryCompatSendsQueryModeHeader"
        documentation: "Clients for query-compatible services MUST send the x-amzn-query-mode header"
        protocol: rpcv2Json
        method: "POST"
        uri: "/service/RpcV2JsonQueryCompatCorpusTests/operation/QueryCompatErrorOp"
        body: """
            {}"""
        bodyMediaType: "application/json"
        headers: {
            "smithy-protocol": "rpc-v2-json"
            "Content-Type": "application/json"
            Accept: "application/json"
            "x-amzn-query-mode": "true"
        }
        forbidHeaders: ["X-Amz-Target"]
        params: {}
    }
])

apply QueryCompatError @httpResponseTests([
    {
        id: "RpcV2JsonQueryCompatNoCustomCodeError"
        documentation: """
            Parses an error that declares no @awsQueryError, so no
            x-amzn-query-error header is sent and the code exposed to the caller
            is the error shape's own name"""
        protocol: rpcv2Json
        code: 400
        body: """
            {
                "__type": "aws.protocoltests.corpus#QueryCompatError",
                "message": "query compatible failure"
            }"""
        bodyMediaType: "application/json"
        headers: { "smithy-protocol": "rpc-v2-json", "Content-Type": "application/json" }
        params: { message: "query compatible failure" }
        vendorParamsShape: ErrorCodeParams
        vendorParams: { code: "QueryCompatError" }
    }
])

apply QueryCompatCustomCodeError @httpResponseTests([
    {
        id: "RpcV2JsonQueryCompatCustomCodeError"
        documentation: """
            Parses an error whose @awsQueryError code is surfaced through the
            x-amzn-query-error header, and exposes that customized code rather
            than the shape name"""
        protocol: rpcv2Json
        code: 400
        body: """
            {
                "__type": "aws.protocoltests.corpus#QueryCompatCustomCodeError",
                "message": "customized query error code"
            }"""
        bodyMediaType: "application/json"
        headers: { "smithy-protocol": "rpc-v2-json", "Content-Type": "application/json", "x-amzn-query-error": "CustomCode;Sender" }
        params: { message: "customized query error code" }
        vendorParamsShape: ErrorCodeParams
        vendorParams: { code: "CustomCode", type: "Sender" }
    }
])
