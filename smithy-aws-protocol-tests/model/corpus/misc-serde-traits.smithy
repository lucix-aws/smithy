$version: "2.0"

namespace aws.protocoltests.corpus

/// Miscellaneous serialization traits that don't fit cleanly into the other
/// layers. These are protocol-agnostic and apply to all services.
@mixin
service MiscSerdeTraitProtocolTestService {
    operations: [
        EndpointHostPrefix
        EndpointHostLabel
        IdempotencyTokenOp
        RequestCompressionOp
    ]
}

// =============================================================================
// @endpoint / @hostLabel — host prefix construction
// =============================================================================

@endpoint(hostPrefix: "data.")
operation EndpointHostPrefix {
    input := {}
    output := {}
}

@endpoint(hostPrefix: "data.{label}.")
operation EndpointHostLabel {
    input := {
        @required @hostLabel
        label: String
    }
    output := {}
}

// =============================================================================
// @idempotencyToken — client auto-populates a UUID if not provided
// =============================================================================

operation IdempotencyTokenOp {
    input := {
        @idempotencyToken
        token: String
    }
    output := {}
}

// =============================================================================
// @requestCompression — gzip-compresses the request body
// =============================================================================

@requestCompression(
    encodings: ["gzip"]
)
operation RequestCompressionOp {
    input := {
        data: String
    }
    output := {}
}
