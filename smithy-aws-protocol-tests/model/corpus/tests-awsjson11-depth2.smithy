$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_1
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// ListOfStructs
// =============================================================================

apply ListOfStructs @httpRequestTests([
    {
        id: "AwsJson11ListOfStructsSerialize",
        documentation: "Serializes a list of structs",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfStructs",
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
        id: "AwsJson11ListOfStructsDeserialize",
        documentation: "Deserializes a list of structs",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11ListOfMapsSerialize",
        documentation: "Serializes a list of maps",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfMaps",
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
        id: "AwsJson11ListOfMapsDeserialize",
        documentation: "Deserializes a list of maps",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11ListOfListsSerialize",
        documentation: "Serializes a list of lists",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfLists",
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
        id: "AwsJson11ListOfListsDeserialize",
        documentation: "Deserializes a list of lists",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11ListOfUnionsSerialize",
        documentation: "Serializes a list of unions with different variants",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfUnions",
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
        id: "AwsJson11ListOfUnionsDeserialize",
        documentation: "Deserializes a list of unions with different variants",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11MapOfStructsSerialize",
        documentation: "Serializes a map of structs",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfStructs",
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
        id: "AwsJson11MapOfStructsDeserialize",
        documentation: "Deserializes a map of structs",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11MapOfMapsSerialize",
        documentation: "Serializes a map of maps",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfMaps",
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
        id: "AwsJson11MapOfMapsDeserialize",
        documentation: "Deserializes a map of maps",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11MapOfListsSerialize",
        documentation: "Serializes a map of lists",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfLists",
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
        id: "AwsJson11MapOfListsDeserialize",
        documentation: "Deserializes a map of lists",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11MapOfUnionsSerialize",
        documentation: "Serializes a map of unions with different variants",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfUnions",
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
        id: "AwsJson11MapOfUnionsDeserialize",
        documentation: "Deserializes a map of unions with different variants",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11SparseListOfStructsSerialize",
        documentation: "Serializes a sparse list with null interspersed",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseListOfStructs",
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
        id: "AwsJson11SparseListOfStructsDeserialize",
        documentation: "Deserializes a sparse list with null interspersed",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11SparseMapOfStructsSerialize",
        documentation: "Serializes a sparse map with a null interspersed between populated entries",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseMapOfStructs",
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
        id: "AwsJson11SparseMapOfStructsDeserialize",
        documentation: "Deserializes a sparse map with a null interspersed between populated entries",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
