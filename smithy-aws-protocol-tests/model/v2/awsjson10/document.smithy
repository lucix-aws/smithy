$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// DocumentMembers
// =============================================================================
apply DocumentMembers @httpRequestTests([
    {
        id: "AwsJson10DocumentMembersJsonObject"
        documentation: "Serializes document as a JSON object"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "documentValue": {"key": "value"}
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentMembers" }
        params: {
            documentValue: { key: "value" }
        }
    }
    {
        id: "AwsJson10DocumentMembersString"
        documentation: "Serializes document as a string"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "documentValue": "hello"
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentMembers" }
        params: { documentValue: "hello" }
    }
    {
        id: "AwsJson10DocumentMembersNumber"
        documentation: "Serializes document as a number"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "documentValue": 42
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentMembers" }
        params: { documentValue: 42 }
    }
    {
        id: "AwsJson10DocumentMembersBoolean"
        documentation: "Serializes document as a boolean"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "documentValue": true
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentMembers" }
        params: { documentValue: true }
    }
    {
        id: "AwsJson10DocumentMembersArray"
        documentation: "Serializes document as an array"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "documentValue": [1, 2, 3]
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentMembers" }
        params: {
            documentValue: [1, 2, 3]
        }
    }
    {
        id: "AwsJson10DocumentMembersNull"
        documentation: "Serializes document as null"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "documentValue": null
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentMembers" }
        params: { documentValue: null }
    }
    {
        id: "AwsJson10DocumentMembersNestedStruct"
        documentation: "Serializes nested struct containing a document"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "nestedStruct": {
                    "documentMember": {"nested": true},
                    "stringMember": "hello"
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentMembers" }
        params: {
            nestedStruct: {
                documentMember: { nested: true }
                stringMember: "hello"
            }
        }
    }
])

apply DocumentMembers @httpResponseTests([
    {
        id: "AwsJson10DocumentMembersDeserializeJsonObject"
        documentation: "Deserializes document as a JSON object"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "documentValue": {"key": "value"}
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            documentValue: { key: "value" }
        }
    }
    {
        id: "AwsJson10DocumentMembersDeserializeString"
        documentation: "Deserializes document as a string"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "documentValue": "hello"
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: { documentValue: "hello" }
    }
    {
        id: "AwsJson10DocumentMembersDeserializeNumber"
        documentation: "Deserializes document as a number"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "documentValue": 42
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: { documentValue: 42 }
    }
    {
        id: "AwsJson10DocumentMembersDeserializeBoolean"
        documentation: "Deserializes document as a boolean"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "documentValue": true
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: { documentValue: true }
    }
    {
        id: "AwsJson10DocumentMembersDeserializeArray"
        documentation: "Deserializes document as an array"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "documentValue": [1, 2, 3]
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            documentValue: [1, 2, 3]
        }
    }
    {
        id: "AwsJson10DocumentMembersDeserializeNestedStruct"
        documentation: "Deserializes nested struct containing a document"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "nestedStruct": {
                    "documentMember": {"nested": true},
                    "stringMember": "hello"
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            nestedStruct: {
                documentMember: { nested: true }
                stringMember: "hello"
            }
        }
    }
    {
        id: "AwsJson10DocumentMembersDeserializeNull"
        documentation: "Deserializes document as null"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "documentValue": null
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: { documentValue: null }
    }
])

// =============================================================================
// ListOfDocuments
// =============================================================================
apply ListOfDocuments @httpRequestTests([
    {
        id: "AwsJson10ListOfDocumentsMixedTypes"
        documentation: "Serializes a list of mixed document types"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "values": [42, "hello", true, [1, 2], {"key": "value"}]
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.ListOfDocuments" }
        params: {
            values: [
                42
                "hello"
                true
                [1, 2]
                {
                    key: "value"
                }
            ]
        }
    }
])

apply ListOfDocuments @httpResponseTests([
    {
        id: "AwsJson10ListOfDocumentsDeserialize"
        documentation: "Deserializes a list of mixed document types"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "values": [42, "hello", true, [1, 2], {"key": "value"}]
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            values: [
                42
                "hello"
                true
                [1, 2]
                {
                    key: "value"
                }
            ]
        }
    }
])

// =============================================================================
// MapOfDocuments
// =============================================================================
apply MapOfDocuments @httpRequestTests([
    {
        id: "AwsJson10MapOfDocumentsMixedTypes"
        documentation: "Serializes a map of mixed document types"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "values": {
                    "num": 42,
                    "str": "hello",
                    "bool": true,
                    "list": [1, 2],
                    "obj": {"key": "value"}
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.MapOfDocuments" }
        params: {
            values: {
                num: 42
                str: "hello"
                bool: true
                list: [1, 2]
                obj: { key: "value" }
            }
        }
    }
])

apply MapOfDocuments @httpResponseTests([
    {
        id: "AwsJson10MapOfDocumentsDeserialize"
        documentation: "Deserializes a map of mixed document types"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "values": {
                    "num": 42,
                    "str": "hello",
                    "bool": true,
                    "list": [1, 2],
                    "obj": {"key": "value"}
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            values: {
                num: 42
                str: "hello"
                bool: true
                list: [1, 2]
                obj: { key: "value" }
            }
        }
    }
])

// =============================================================================
// DocumentUnion
// =============================================================================
apply DocumentUnion @httpRequestTests([
    {
        id: "AwsJson10DocumentUnionDocumentValue"
        documentation: "Serializes union with document value variant"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "value": {
                    "documentValue": {"nested": "object", "count": 5}
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.DocumentUnion" }
        params: {
            value: {
                documentValue: { nested: "object", count: 5 }
            }
        }
    }
])

apply DocumentUnion @httpResponseTests([
    {
        id: "AwsJson10DocumentUnionDeserializeDocumentValue"
        documentation: "Deserializes union with document value variant"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "value": {
                    "documentValue": {"nested": "object", "count": 5}
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            value: {
                documentValue: { nested: "object", count: 5 }
            }
        }
    }
])
