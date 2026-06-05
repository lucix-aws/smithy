$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use aws.protocols#awsQueryCompatible
use aws.protocols#awsQueryError
use smithy.protocols#rpcv2Cbor

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

// =============================================================================
// Operation with query-compat errors
// =============================================================================

operation QueryCompatErrorOp {
    input := {}
    output := {}
    errors: [QueryCompatError, QueryCompatCustomCodeError]
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
