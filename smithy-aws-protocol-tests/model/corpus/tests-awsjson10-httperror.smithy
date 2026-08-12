$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use smithy.test#httpResponseTests

// =============================================================================
// HttpErrorOperation — @httpError status code overrides
//
// Each case is applied to the @error STRUCTURE rather than the operation,
// which is what smithy.test#httpResponseTests' selector targets for errors.
// awsJson discriminates the error shape from the body's "__type" field, which
// carries the absolute shape ID; the status code is asserted independently so
// that a client that discriminates purely on status (or purely on __type)
// cannot pass by accident.
// =============================================================================

apply HttpErrorConflict @httpResponseTests([
    {
        id: "AwsJson10HttpErrorConflictDeserialize",
        documentation: """
            Deserializes a client error whose @httpError(409) overrides the
            default 400 status implied by @error("client")""",
        protocol: awsJson1_0,
        code: 409,
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorConflict",
                "message": "resource already exists"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            message: "resource already exists",
        }
    },
])

apply HttpErrorGone @httpResponseTests([
    {
        id: "AwsJson10HttpErrorGoneDeserialize",
        documentation: """
            Deserializes a client error whose @httpError(410) overrides the
            default 400 status, with more than one modeled member""",
        protocol: awsJson1_0,
        code: 410,
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorGone",
                "message": "resource was deleted",
                "details": "deleted on 2021-01-01"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            message: "resource was deleted",
            details: "deleted on 2021-01-01",
        }
    },
])

apply HttpErrorServiceUnavailable @httpResponseTests([
    {
        id: "AwsJson10HttpErrorServiceUnavailableDeserialize",
        documentation: """
            Deserializes a server error whose @httpError(503) overrides the
            default 500 status implied by @error("server")""",
        protocol: awsJson1_0,
        code: 503,
        body: """
            {
                "__type": "aws.protocoltests.corpus#HttpErrorServiceUnavailable",
                "message": "try again later",
                "retryAfterSeconds": 42
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            message: "try again later",
            retryAfterSeconds: 42,
        }
    },
])
