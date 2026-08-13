$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#ec2QueryName

// Serialization traits that affect the request or response envelope rather than
// the shape of the body, and that every protocol supports. Mixed into all
// protocol services.
//
// One operation per trait. These are request-only where the behavior only happens
// on the way out (host resolution, token auto-fill, body compression), which is a
// genuine direction-specific exception to the case symmetry rule.
@mixin
service MiscSerdeTraitProtocolTestService {
    operations: [
        EndpointHostPrefix
        EndpointHostLabel
        IdempotencyTokenOp
        RequestCompressionOp
        MediaTypeOp
    ]
}

@endpoint(hostPrefix: "data.")
operation EndpointHostPrefix {
    input: EndpointHostPrefixInput
    output: EndpointHostPrefixOutput
}

structure EndpointHostPrefixInput {}

structure EndpointHostPrefixOutput {}

@endpoint(hostPrefix: "data.{label}.")
operation EndpointHostLabel {
    input: EndpointHostLabelInput
    output: EndpointHostLabelOutput
}

structure EndpointHostLabelInput {
    @required
    @hostLabel
    label: String
}

structure EndpointHostLabelOutput {}

operation IdempotencyTokenOp {
    input: IdempotencyTokenOpInput
    output: IdempotencyTokenOpOutput
}

structure IdempotencyTokenOpInput {
    @idempotencyToken
    token: String
}

structure IdempotencyTokenOpOutput {}

@requestCompression(
    encodings: ["gzip"]
)
operation RequestCompressionOp {
    input: RequestCompressionOpInput
    output: RequestCompressionOpOutput
}

structure RequestCompressionOpInput {
    data: String
}

structure RequestCompressionOpOutput {}

operation MediaTypeOp {
    input: MediaTypeOpInputOutput
    output: MediaTypeOpInputOutput
}

structure MediaTypeOpInputOutput {
    @jsonName("jsonMediaTypeMember")
    @xmlName("xmlMediaTypeMember")
    @ec2QueryName("ec2MediaTypeMember")
    mediaTypeMember: MediaTypeJsonString
}

@mediaType("application/json")
string MediaTypeJsonString
