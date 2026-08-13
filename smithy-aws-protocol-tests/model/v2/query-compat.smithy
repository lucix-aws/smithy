$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use aws.protocols#awsQueryCompatible
use aws.protocols#awsQueryError
use smithy.protocols#rpcv2Cbor
use smithy.protocols#rpcv2Json

// @awsQueryCompatible, for services that migrated off awsQuery and have to keep
// exposing awsQuery error codes to old callers. Standalone services rather than a
// mixin layer, because the trait is service-level and only three protocols accept
// it. All three share QueryCompatErrorOp, whose two errors cover the code being
// derived from the shape name and the code being overridden by @awsQueryError.
//
// Extend by adding a service when another protocol accepts the trait, or an error
// shape when a new code-mapping case is needed. Note @awsQueryError's
// httpResponseCode is not applied here: it records what awsQuery would have
// returned, and the status still comes from @error.
@awsJson1_0
@awsQueryCompatible
service AwsJson10QueryCompatCorpusTests {
    operations: [
        QueryCompatErrorOp
    ]
}

@rpcv2Cbor
@awsQueryCompatible
service RpcV2CborQueryCompatCorpusTests {
    operations: [
        QueryCompatErrorOp
    ]
}

@rpcv2Json
@awsQueryCompatible
@aws.api#service(sdkId: "RpcV2JsonQueryCompatCorpus", arnNamespace: "rpcv2jsonquerycompatcorpus")
@aws.auth#sigv4(name: "rpcv2jsonquerycompatcorpus")
service RpcV2JsonQueryCompatCorpusTests {
    operations: [
        QueryCompatErrorOp
    ]
}

operation QueryCompatErrorOp {
    input: QueryCompatErrorOpInput
    output: QueryCompatErrorOpOutput
    errors: [
        QueryCompatError
        QueryCompatCustomCodeError
    ]
}

structure QueryCompatErrorOpInput {}

structure QueryCompatErrorOpOutput {}

@error("client")
structure QueryCompatError {
    message: String
}

@awsQueryError(code: "CustomCode", httpResponseCode: 402)
@error("client")
structure QueryCompatCustomCodeError {
    message: String
}
