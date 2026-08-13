$version: "2.0"

namespace aws.protocoltests.corpus

// The document type, split out of Core because rpcv2Cbor, restXml, and the query
// protocols don't support it. Services opt in by mixing this in.
//
// Covers document as the target of each container: struct, list, map, and union.
// Extend only for a container that can hold a document and isn't covered yet.
@mixin
service DocumentProtocolTestService with [CoreProtocolTestService] {
    operations: [
        DocumentMembers
        ListOfDocuments
        MapOfDocuments
        DocumentUnion
    ]
}

operation DocumentMembers {
    input: DocumentMembersInput
    output: DocumentMembersOutput
}

structure DocumentMembersInput {
    @jsonName("jsonDocumentValue")
    documentValue: Document

    @jsonName("jsonNestedStruct")
    nestedStruct: DocumentStruct
}

structure DocumentMembersOutput {
    @jsonName("jsonDocumentValue")
    documentValue: Document

    @jsonName("jsonNestedStruct")
    nestedStruct: DocumentStruct
}

structure DocumentStruct {
    @jsonName("jsonDocumentMember")
    documentMember: Document

    @jsonName("jsonStringMember")
    stringMember: String
}

operation ListOfDocuments {
    input: ListOfDocumentsInput
    output: ListOfDocumentsOutput
}

structure ListOfDocumentsInput {
    @jsonName("jsonValues")
    values: DocumentList
}

structure ListOfDocumentsOutput {
    @jsonName("jsonValues")
    values: DocumentList
}

list DocumentList {
    member: Document
}

operation MapOfDocuments {
    input: MapOfDocumentsInput
    output: MapOfDocumentsOutput
}

structure MapOfDocumentsInput {
    @jsonName("jsonValues")
    values: DocumentMap
}

structure MapOfDocumentsOutput {
    @jsonName("jsonValues")
    values: DocumentMap
}

map DocumentMap {
    key: String
    value: Document
}

operation DocumentUnion {
    input: DocumentUnionInput
    output: DocumentUnionOutput
}

structure DocumentUnionInput {
    @jsonName("jsonValue")
    value: DocumentUnionShape
}

structure DocumentUnionOutput {
    @jsonName("jsonValue")
    value: DocumentUnionShape
}

union DocumentUnionShape {
    @jsonName("jsonDocumentValue")
    documentValue: Document

    @jsonName("jsonStringValue")
    stringValue: String

    @jsonName("jsonIntegerValue")
    integerValue: Integer
}
