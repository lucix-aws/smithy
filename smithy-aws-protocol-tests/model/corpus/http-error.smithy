$version: "2.0"

namespace aws.protocoltests.corpus

/// @httpError trait coverage. This overrides the default HTTP status code
/// derived from @error("client"|"server"). Separated into its own mixin because
/// the RPC v2 family supports @httpError independently of the full HTTP binding
/// traits layer.
@mixin
service HttpErrorProtocolTestService with [CoreProtocolTestService] {
    operations: [
        HttpErrorOperation
    ]
}

operation HttpErrorOperation {
    input := {}
    output := {}
    errors: [HttpErrorConflict, HttpErrorGone, HttpErrorServiceUnavailable]
}

@error("client")
@httpError(409)
structure HttpErrorConflict {
    @jsonName("jsonMessage") @xmlName("xmlMessage") @ec2QueryName("ec2Message")
    message: String
}

@error("client")
@httpError(410)
structure HttpErrorGone {
    @jsonName("jsonMessage") @xmlName("xmlMessage") @ec2QueryName("ec2Message")
    message: String
    @jsonName("jsonDetails") @xmlName("xmlDetails") @ec2QueryName("ec2Details")
    details: String
}

@error("server")
@httpError(503)
structure HttpErrorServiceUnavailable {
    @jsonName("jsonMessage") @xmlName("xmlMessage") @ec2QueryName("ec2Message")
    message: String
    @jsonName("jsonRetryAfter") @xmlName("xmlRetryAfter") @ec2QueryName("ec2RetryAfter")
    retryAfterSeconds: Integer
}
