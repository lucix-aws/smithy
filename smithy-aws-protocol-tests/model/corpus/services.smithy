$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use aws.protocols#awsJson1_1
use aws.protocols#restJson1
use aws.protocols#restXml
use smithy.protocols#rpcv2Cbor

// =============================================================================
// JSON RPC protocols — body serde + defaults, no HTTP bindings
// =============================================================================

@awsJson1_0
service AwsJson10CorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService] {}

@awsJson1_1
service AwsJson11CorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService] {}

// =============================================================================
// CBOR RPC — body serde + defaults, no HTTP bindings
// =============================================================================

@rpcv2Cbor
service RpcV2CborCorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService] {}

// =============================================================================
// REST protocols — all three layers
// =============================================================================

@restJson1
service RestJson1CorpusTests with [HttpBindingProtocolTestService, DefaultsProtocolTestService] {}

@restXml
service RestXmlCorpusTests with [HttpBindingProtocolTestService, DefaultsProtocolTestService, XmlTraitsProtocolTestService] {}

// =============================================================================
// Apply @http to core operations for REST protocol compatibility.
// REST protocols require every operation to have an @http trait.
// =============================================================================

// Core operations
apply ScalarMembers @http(method: "POST", uri: "/corpus/ScalarMembers")
apply ListOfScalars @http(method: "POST", uri: "/corpus/ListOfScalars")
apply SparseListOfScalars @http(method: "POST", uri: "/corpus/SparseListOfScalars")
apply MapOfScalars @http(method: "POST", uri: "/corpus/MapOfScalars")
apply SparseMapOfScalars @http(method: "POST", uri: "/corpus/SparseMapOfScalars")
apply UnionOfScalars @http(method: "POST", uri: "/corpus/UnionOfScalars")
apply UnionOfStruct @http(method: "POST", uri: "/corpus/UnionOfStruct")
apply UnionOfList @http(method: "POST", uri: "/corpus/UnionOfList")
apply UnionOfMap @http(method: "POST", uri: "/corpus/UnionOfMap")
apply UnionOfUnion @http(method: "POST", uri: "/corpus/UnionOfUnion")
apply StructOfScalars @http(method: "POST", uri: "/corpus/StructOfScalars")
apply ListOfStructs @http(method: "POST", uri: "/corpus/ListOfStructs")
apply ListOfMaps @http(method: "POST", uri: "/corpus/ListOfMaps")
apply ListOfLists @http(method: "POST", uri: "/corpus/ListOfLists")
apply ListOfUnions @http(method: "POST", uri: "/corpus/ListOfUnions")
apply MapOfStructs @http(method: "POST", uri: "/corpus/MapOfStructs")
apply MapOfMaps @http(method: "POST", uri: "/corpus/MapOfMaps")
apply MapOfLists @http(method: "POST", uri: "/corpus/MapOfLists")
apply MapOfUnions @http(method: "POST", uri: "/corpus/MapOfUnions")
apply SparseListOfStructs @http(method: "POST", uri: "/corpus/SparseListOfStructs")
apply SparseMapOfStructs @http(method: "POST", uri: "/corpus/SparseMapOfStructs")
apply RecursiveStruct @http(method: "POST", uri: "/corpus/RecursiveStruct")
apply RecursiveUnion @http(method: "POST", uri: "/corpus/RecursiveUnion")
apply EmptyInputOutput @http(method: "POST", uri: "/corpus/EmptyInputOutput")
apply NoInputOutput @http(method: "POST", uri: "/corpus/NoInputOutput")

// Defaults operations
apply DefaultScalars @http(method: "POST", uri: "/corpus/DefaultScalars")
apply DefaultCollections @http(method: "POST", uri: "/corpus/DefaultCollections")
apply NestedDefaults @http(method: "POST", uri: "/corpus/NestedDefaults")
apply RequiredMembers @http(method: "POST", uri: "/corpus/RequiredMembers")
apply NullSparseMembers @http(method: "POST", uri: "/corpus/NullSparseMembers")
apply ClientOptionalDefaults @http(method: "POST", uri: "/corpus/ClientOptionalDefaults")

// XML traits operations
apply FlattenedListOfScalars @http(method: "POST", uri: "/corpus/FlattenedListOfScalars")
apply FlattenedListOfStructs @http(method: "POST", uri: "/corpus/FlattenedListOfStructs")
apply FlattenedListOfLists @http(method: "POST", uri: "/corpus/FlattenedListOfLists")
apply FlattenedListOfMaps @http(method: "POST", uri: "/corpus/FlattenedListOfMaps")
apply FlattenedListOfUnions @http(method: "POST", uri: "/corpus/FlattenedListOfUnions")
apply FlattenedMapOfScalars @http(method: "POST", uri: "/corpus/FlattenedMapOfScalars")
apply FlattenedMapOfStructs @http(method: "POST", uri: "/corpus/FlattenedMapOfStructs")
apply FlattenedMapOfMaps @http(method: "POST", uri: "/corpus/FlattenedMapOfMaps")
apply FlattenedMapOfLists @http(method: "POST", uri: "/corpus/FlattenedMapOfLists")
apply FlattenedMapOfUnions @http(method: "POST", uri: "/corpus/FlattenedMapOfUnions")
apply FlattenedSparseListOfStructs @http(method: "POST", uri: "/corpus/FlattenedSparseListOfStructs")
apply FlattenedSparseMapOfStructs @http(method: "POST", uri: "/corpus/FlattenedSparseMapOfStructs")

// =============================================================================
// Query protocols — need special handling (no unions, no document type).
// To be added with appropriate shape subsetting.
// =============================================================================
