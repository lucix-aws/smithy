$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use aws.protocols#awsQueryCompatible
use aws.protocols#awsQueryError
use smithy.protocols#rpcv2Cbor
use smithy.protocols#rpcv2Json

// =============================================================================
// Query-compatible services — tests @awsQueryCompatible + @awsQueryError
// =============================================================================
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

/// Carries @aws.api#service / @aws.auth#sigv4 because Go codegen requires an
/// AWS service trait to build a client at all; the other two query-compat
/// services above are not wired into codegen and so have never needed them.
@rpcv2Json
@awsQueryCompatible
@aws.api#service(sdkId: "RpcV2JsonQueryCompatCorpus", arnNamespace: "rpcv2jsonquerycompatcorpus")
@aws.auth#sigv4(name: "rpcv2jsonquerycompatcorpus")
service RpcV2JsonQueryCompatCorpusTests {
    operations: [
        QueryCompatErrorOp
    ]
}

// =============================================================================
// Operation with query-compat errors
// =============================================================================
operation QueryCompatErrorOp {
    input := {}
    output := {}
    errors: [
        QueryCompatError
        QueryCompatCustomCodeError
    ]
}

@error("client")
structure QueryCompatError {
    message: String
}

@awsQueryError(code: "CustomCode", httpResponseCode: 402)
@error("client")
structure QueryCompatCustomCodeError {
    message: String
}
