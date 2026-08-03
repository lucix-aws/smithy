$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// ListOfStructs
// =============================================================================

apply ListOfStructs @httpRequestTests([
    {
        id: "AwsJson10ListOfStructsSerialize",
        documentation: "Serializes a list of structs",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": [
                    {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfStructs",
        },
        params: {
            values: [
                { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            ]
        }
    },
])

apply ListOfStructs @httpResponseTests([
    {
        id: "AwsJson10ListOfStructsDeserialize",
        documentation: "Deserializes a list of structs",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": [
                    {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: [
                { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            ]
        }
    },
])

// =============================================================================
// ListOfMaps
// =============================================================================

apply ListOfMaps @httpRequestTests([
    {
        id: "AwsJson10ListOfMapsSerialize",
        documentation: "Serializes a list of maps",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": [
                    {"key1": "a", "key2": "b"},
                    {"key3": "c"}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfMaps",
        },
        params: {
            values: [
                { key1: "a", key2: "b" },
                { key3: "c" },
            ]
        }
    },
])

apply ListOfMaps @httpResponseTests([
    {
        id: "AwsJson10ListOfMapsDeserialize",
        documentation: "Deserializes a list of maps",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": [
                    {"key1": "a", "key2": "b"},
                    {"key3": "c"}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: [
                { key1: "a", key2: "b" },
                { key3: "c" },
            ]
        }
    },
])

// =============================================================================
// ListOfLists
// =============================================================================

apply ListOfLists @httpRequestTests([
    {
        id: "AwsJson10ListOfListsSerialize",
        documentation: "Serializes a list of lists",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": [
                    ["a", "b"],
                    ["c", "d", "e"]
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfLists",
        },
        params: {
            values: [
                ["a", "b"],
                ["c", "d", "e"],
            ]
        }
    },
])

apply ListOfLists @httpResponseTests([
    {
        id: "AwsJson10ListOfListsDeserialize",
        documentation: "Deserializes a list of lists",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": [
                    ["a", "b"],
                    ["c", "d", "e"]
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: [
                ["a", "b"],
                ["c", "d", "e"],
            ]
        }
    },
])

// =============================================================================
// ListOfUnions
// =============================================================================

apply ListOfUnions @httpRequestTests([
    {
        id: "AwsJson10ListOfUnionsSerialize",
        documentation: "Serializes a list of unions with different variants",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": [
                    {"stringValue": "hello"},
                    {"integerValue": 42}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfUnions",
        },
        params: {
            values: [
                { stringValue: "hello" },
                { integerValue: 42 },
            ]
        }
    },
])

apply ListOfUnions @httpResponseTests([
    {
        id: "AwsJson10ListOfUnionsDeserialize",
        documentation: "Deserializes a list of unions with different variants",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": [
                    {"stringValue": "hello"},
                    {"integerValue": 42}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: [
                { stringValue: "hello" },
                { integerValue: 42 },
            ]
        }
    },
])

// =============================================================================
// MapOfStructs
// =============================================================================

apply MapOfStructs @httpRequestTests([
    {
        id: "AwsJson10MapOfStructsSerialize",
        documentation: "Serializes a map of structs",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": {
                    "first": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    "second": {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfStructs",
        },
        params: {
            values: {
                first: { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                second: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            }
        }
    },
])

apply MapOfStructs @httpResponseTests([
    {
        id: "AwsJson10MapOfStructsDeserialize",
        documentation: "Deserializes a map of structs",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": {
                    "first": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    "second": {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: {
                first: { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                second: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            }
        }
    },
])

// =============================================================================
// MapOfMaps
// =============================================================================

apply MapOfMaps @httpRequestTests([
    {
        id: "AwsJson10MapOfMapsSerialize",
        documentation: "Serializes a map of maps",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": {
                    "first": {"key1": "a", "key2": "b"},
                    "second": {"key3": "c"}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfMaps",
        },
        params: {
            values: {
                first: { key1: "a", key2: "b" },
                second: { key3: "c" },
            }
        }
    },
])

apply MapOfMaps @httpResponseTests([
    {
        id: "AwsJson10MapOfMapsDeserialize",
        documentation: "Deserializes a map of maps",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": {
                    "first": {"key1": "a", "key2": "b"},
                    "second": {"key3": "c"}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: {
                first: { key1: "a", key2: "b" },
                second: { key3: "c" },
            }
        }
    },
])

// =============================================================================
// MapOfLists
// =============================================================================

apply MapOfLists @httpRequestTests([
    {
        id: "AwsJson10MapOfListsSerialize",
        documentation: "Serializes a map of lists",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": {
                    "first": ["a", "b"],
                    "second": ["c", "d", "e"]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfLists",
        },
        params: {
            values: {
                first: ["a", "b"],
                second: ["c", "d", "e"],
            }
        }
    },
])

apply MapOfLists @httpResponseTests([
    {
        id: "AwsJson10MapOfListsDeserialize",
        documentation: "Deserializes a map of lists",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": {
                    "first": ["a", "b"],
                    "second": ["c", "d", "e"]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: {
                first: ["a", "b"],
                second: ["c", "d", "e"],
            }
        }
    },
])

// =============================================================================
// MapOfUnions
// =============================================================================

apply MapOfUnions @httpRequestTests([
    {
        id: "AwsJson10MapOfUnionsSerialize",
        documentation: "Serializes a map of unions with different variants",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": {
                    "first": {"stringValue": "hello"},
                    "second": {"integerValue": 42}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfUnions",
        },
        params: {
            values: {
                first: { stringValue: "hello" },
                second: { integerValue: 42 },
            }
        }
    },
])

apply MapOfUnions @httpResponseTests([
    {
        id: "AwsJson10MapOfUnionsDeserialize",
        documentation: "Deserializes a map of unions with different variants",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": {
                    "first": {"stringValue": "hello"},
                    "second": {"integerValue": 42}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: {
                first: { stringValue: "hello" },
                second: { integerValue: 42 },
            }
        }
    },
])

// =============================================================================
// SparseListOfStructs
// =============================================================================

apply SparseListOfStructs @httpRequestTests([
    {
        id: "AwsJson10SparseListOfStructsSerialize",
        documentation: "Serializes a sparse list with null interspersed",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": [
                    {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    null,
                    {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseListOfStructs",
        },
        params: {
            values: [
                { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                null,
                { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            ]
        }
    },
])

apply SparseListOfStructs @httpResponseTests([
    {
        id: "AwsJson10SparseListOfStructsDeserialize",
        documentation: "Deserializes a sparse list with null interspersed",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": [
                    {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    null,
                    {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                ]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: [
                { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                null,
                { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            ]
        }
    },
])

// =============================================================================
// SparseMapOfStructs
// =============================================================================

apply SparseMapOfStructs @httpRequestTests([
    {
        id: "AwsJson10SparseMapOfStructsSerialize",
        documentation: "Serializes a sparse map with a null interspersed between populated entries",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": {
                    "a": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    "b": null,
                    "c": {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseMapOfStructs",
        },
        params: {
            values: {
                a: { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                b: null,
                c: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            }
        }
    },
])

apply SparseMapOfStructs @httpResponseTests([
    {
        id: "AwsJson10SparseMapOfStructsDeserialize",
        documentation: "Deserializes a sparse map with a null interspersed between populated entries",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "values": {
                    "a": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    "b": null,
                    "c": {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            values: {
                a: { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                b: null,
                c: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            }
        }
    },
])
