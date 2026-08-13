$version: "2.0"

namespace aws.protocoltests.corpus

/// Document type operations. Only applicable to protocols that support the
/// document type (awsJson1_0, awsJson1_1, rpcv2Cbor, restJson1).
/// XML/query protocols do not support documents.
@mixin
service DocumentProtocolTestService with [CoreProtocolTestService] {
    operations: [
        DocumentMembers
        ListOfDocuments
        MapOfDocuments
        DocumentUnion
    ]
}

// =============================================================================
// struct -> document
// =============================================================================
operation DocumentMembers {
    input := {
        @jsonName("jsonDocumentValue")
        documentValue: Document

        @jsonName("jsonNestedStruct")
        nestedStruct: DocumentStruct
    }

    output := {
        @jsonName("jsonDocumentValue")
        documentValue: Document

        @jsonName("jsonNestedStruct")
        nestedStruct: DocumentStruct
    }
}

structure DocumentStruct {
    @jsonName("jsonDocumentMember")
    documentMember: Document

    @jsonName("jsonStringMember")
    stringMember: String
}

// =============================================================================
// list -> document
// =============================================================================
operation ListOfDocuments {
    input := {
        @jsonName("jsonValues")
        values: DocumentList
    }

    output := {
        @jsonName("jsonValues")
        values: DocumentList
    }
}

list DocumentList {
    member: Document
}

// =============================================================================
// map -> document
// =============================================================================
operation MapOfDocuments {
    input := {
        @jsonName("jsonValues")
        values: DocumentMap
    }

    output := {
        @jsonName("jsonValues")
        values: DocumentMap
    }
}

map DocumentMap {
    key: String
    value: Document
}

// =============================================================================
// union -> document
// =============================================================================
operation DocumentUnion {
    input := {
        @jsonName("jsonValue")
        value: DocumentUnionShape
    }

    output := {
        @jsonName("jsonValue")
        value: DocumentUnionShape
    }
}

union DocumentUnionShape {
    @jsonName("jsonDocumentValue")
    documentValue: Document

    @jsonName("jsonStringValue")
    stringValue: String

    @jsonName("jsonIntegerValue")
    integerValue: Integer
}
