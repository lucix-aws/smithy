$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#ec2QueryName

// @httpError, which overrides the status code that @error("client"|"server")
// would otherwise imply. Its own layer because the RPC v2 family supports
// @httpError without supporting the HTTP binding traits, so it can't live in
// HttpBindings. Mixed into every non-query protocol.
//
// The cases apply to the error structures, not to the operation. Extend by adding
// an error shape with a status code that isn't represented yet.
@mixin
service HttpErrorProtocolTestService with [CoreProtocolTestService] {
    operations: [
        HttpErrorOperation
    ]
}

operation HttpErrorOperation {
    input: HttpErrorOperationInput
    output: HttpErrorOperationOutput
    errors: [
        HttpErrorConflict
        HttpErrorGone
        HttpErrorServiceUnavailable
    ]
}

structure HttpErrorOperationInput {}

structure HttpErrorOperationOutput {}

@error("client")
@httpError(409)
structure HttpErrorConflict {
    @jsonName("jsonMessage")
    @xmlName("xmlMessage")
    @ec2QueryName("ec2Message")
    message: String
}

@error("client")
@httpError(410)
structure HttpErrorGone {
    @jsonName("jsonMessage")
    @xmlName("xmlMessage")
    @ec2QueryName("ec2Message")
    message: String

    @jsonName("jsonDetails")
    @xmlName("xmlDetails")
    @ec2QueryName("ec2Details")
    details: String
}

@error("server")
@httpError(503)
structure HttpErrorServiceUnavailable {
    @jsonName("jsonMessage")
    @xmlName("xmlMessage")
    @ec2QueryName("ec2Message")
    message: String

    @jsonName("jsonRetryAfter")
    @xmlName("xmlRetryAfter")
    @ec2QueryName("ec2RetryAfter")
    retryAfterSeconds: Integer
}
