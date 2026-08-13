$version: "2.0"

namespace aws.protocoltests.corpus

use smithy.protocols#rpcv2Json
use smithy.test#httpResponseTests

// =============================================================================
// HttpErrorOperation — @httpError status code overrides
//
// Each case is applied to the @error STRUCTURE rather than the operation,
// which is what smithy.test#httpResponseTests' selector targets for errors.
// rpcv2Json discriminates the error shape from the body's "__type" field, which
// carries the absolute shape ID; the status code is asserted independently so
// that a client that discriminates purely on status (or purely on __type)
// cannot pass by accident.
// =============================================================================
apply HttpErrorConflict @httpResponseTests([
    {
        id: "RpcV2JsonHttpErrorConflictDeserialize"
        documentation: """
            Deserializes a client error whose @httpError(409) overrides the
            default 400 status implied by @error("client")"""
        protocol: rpcv2Json
        code: 409
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorConflict",
                "message": "resource already exists"
            }"""
        bodyMediaType: "application/json"
        headers: { "smithy-protocol": "rpc-v2-json", "Content-Type": "application/json" }
        params: { message: "resource already exists" }
    }
])

apply HttpErrorGone @httpResponseTests([
    {
        id: "RpcV2JsonHttpErrorGoneDeserialize"
        documentation: """
            Deserializes a client error whose @httpError(410) overrides the
            default 400 status, with more than one modeled member"""
        protocol: rpcv2Json
        code: 410
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorGone",
                "message": "resource was deleted",
                "details": "deleted on 2021-01-01"
            }"""
        bodyMediaType: "application/json"
        headers: { "smithy-protocol": "rpc-v2-json", "Content-Type": "application/json" }
        params: { message: "resource was deleted", details: "deleted on 2021-01-01" }
    }
])

apply HttpErrorServiceUnavailable @httpResponseTests([
    {
        id: "RpcV2JsonHttpErrorServiceUnavailableDeserialize"
        documentation: """
            Deserializes a server error whose @httpError(503) overrides the
            default 500 status implied by @error("server")"""
        protocol: rpcv2Json
        code: 503
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorServiceUnavailable",
                "message": "try again later",
                "retryAfterSeconds": 42
            }"""
        bodyMediaType: "application/json"
        headers: { "smithy-protocol": "rpc-v2-json", "Content-Type": "application/json" }
        params: { message: "try again later", retryAfterSeconds: 42 }
    }
])
