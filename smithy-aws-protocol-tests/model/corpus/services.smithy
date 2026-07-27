$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use aws.protocols#awsJson1_1
use aws.protocols#restJson1
use aws.protocols#restXml
use aws.protocols#awsQuery
use aws.protocols#ec2Query
use smithy.protocols#rpcv2Cbor
use smithy.protocols#rpcv2Json

// =============================================================================
// JSON RPC protocols — body serde + defaults, no HTTP bindings
// =============================================================================

@awsJson1_0
service AwsJson10CorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService, DocumentProtocolTestService, EventStreamProtocolTestService, HttpErrorProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}

@awsJson1_1
service AwsJson11CorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService, DocumentProtocolTestService, EventStreamProtocolTestService, HttpErrorProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}

// =============================================================================
// RPC v2 — body serde + defaults, no HTTP bindings
// =============================================================================

@rpcv2Cbor
service RpcV2CborCorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService, EventStreamProtocolTestService, HttpErrorProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}

@rpcv2Json
service RpcV2JsonCorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService, DocumentProtocolTestService, EventStreamProtocolTestService, HttpErrorProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}

// =============================================================================
// REST protocols — all three layers
// =============================================================================

@restJson1
service RestJson1CorpusTests with [HttpBindingProtocolTestService, DefaultsProtocolTestService, DocumentProtocolTestService, EventStreamProtocolTestService, HttpErrorProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}

@restXml
service RestXmlCorpusTests with [HttpBindingProtocolTestService, DefaultsProtocolTestService, XmlTraitsProtocolTestService, EventStreamProtocolTestService, HttpErrorProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}

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
apply ErrorOperation @http(method: "POST", uri: "/corpus/ErrorOperation")

// Document operations
apply DocumentMembers @http(method: "POST", uri: "/corpus/DocumentMembers")
apply ListOfDocuments @http(method: "POST", uri: "/corpus/ListOfDocuments")
apply MapOfDocuments @http(method: "POST", uri: "/corpus/MapOfDocuments")
apply DocumentUnion @http(method: "POST", uri: "/corpus/DocumentUnion")

// Event stream operations
apply EventStreamResponse @http(method: "POST", uri: "/corpus/EventStreamResponse")
apply EventStreamResponseBlobPayload @http(method: "POST", uri: "/corpus/EventStreamResponseBlobPayload")
apply EventStreamResponseHeaders @http(method: "POST", uri: "/corpus/EventStreamResponseHeaders")
apply EventStreamResponseImplicitPayload @http(method: "POST", uri: "/corpus/EventStreamResponseImplicitPayload")
apply EventStreamError @http(method: "POST", uri: "/corpus/EventStreamError")
apply EventStreamRequest @http(method: "POST", uri: "/corpus/EventStreamRequest")
apply EventStreamInitialResponse @http(method: "POST", uri: "/corpus/EventStreamInitialResponse")

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
apply XmlAttributeMembers @http(method: "POST", uri: "/corpus/XmlAttributeMembers")
apply XmlNamespaceMembers @http(method: "POST", uri: "/corpus/XmlNamespaceMembers")
apply XmlNamedListMembers @http(method: "POST", uri: "/corpus/XmlNamedListMembers")
apply XmlNamedMapMembers @http(method: "POST", uri: "/corpus/XmlNamedMapMembers")
apply FlattenedXmlNamedListMembers @http(method: "POST", uri: "/corpus/FlattenedXmlNamedListMembers")
apply FlattenedXmlNamedMapMembers @http(method: "POST", uri: "/corpus/FlattenedXmlNamedMapMembers")
apply XmlNameOnTargetShape @http(method: "POST", uri: "/corpus/XmlNameOnTargetShape")
apply XmlNamePrefixed @http(method: "POST", uri: "/corpus/XmlNamePrefixed")
apply XmlNamespaceOnUnion @http(method: "POST", uri: "/corpus/XmlNamespaceOnUnion")

// Http error operation
apply HttpErrorOperation @http(method: "POST", uri: "/corpus/HttpErrorOperation")

// No-traits operations
apply NoTraitScalarMembers @http(method: "POST", uri: "/corpus/NoTraitScalarMembers")
apply NoTraitStructOfScalars @http(method: "POST", uri: "/corpus/NoTraitStructOfScalars")
apply NoTraitListOfScalars @http(method: "POST", uri: "/corpus/NoTraitListOfScalars")
apply NoTraitMapOfScalars @http(method: "POST", uri: "/corpus/NoTraitMapOfScalars")
apply NoTraitUnionMembers @http(method: "POST", uri: "/corpus/NoTraitUnionMembers")

// Misc serde trait operations
apply EndpointHostPrefix @http(method: "POST", uri: "/corpus/EndpointHostPrefix")
apply EndpointHostLabel @http(method: "POST", uri: "/corpus/EndpointHostLabel")
apply IdempotencyTokenOp @http(method: "POST", uri: "/corpus/IdempotencyTokenOp")
apply RequestCompressionOp @http(method: "POST", uri: "/corpus/RequestCompressionOp")

// =============================================================================
// Query protocols
// =============================================================================

@awsQuery
@xmlNamespace(uri: "https://corpus.example.com/")
service AwsQueryCorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService, XmlTraitsProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}

@ec2Query
@xmlNamespace(uri: "https://corpus.example.com/")
service Ec2QueryCorpusTests with [CoreProtocolTestService, DefaultsProtocolTestService, XmlTraitsProtocolTestService, NoProtocolTraitsBehaviorService, MiscSerdeTraitProtocolTestService] {}
