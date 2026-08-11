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
        documentation: "Serializes lists of maps for all scalar leaf types",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": [{"k1": true, "k2": false}, {"k3": false, "k4": true, "k5": true}],
                "integers": [{"k1": 1, "k2": 2}, {"k3": 3, "k4": 4, "k5": 5}],
                "strings": [{"k1": "a", "k2": "b"}, {"k3": "c", "k4": "d", "k5": "e"}],
                "blobs": [{"k1": "Zm9v", "k2": "YmFy"}, {"k3": "YmF6", "k4": "cXV4", "k5": "cXV1eA=="}],
                "timestamps": [{"k1": 1609502096, "k2": 1609588496}, {"k3": 1609674896, "k4": 1609761296, "k5": 1609847696}],
                "enums": [{"k1": "Foo", "k2": "Bar"}, {"k3": "Baz", "k4": "Foo", "k5": "Bar"}],
                "intEnums": [{"k1": 1, "k2": 2}, {"k3": 3, "k4": 1, "k5": 2}]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfMaps",
        },
        params: {
            booleans: [{k1: true, k2: false}, {k3: false, k4: true, k5: true}],
            integers: [{k1: 1, k2: 2}, {k3: 3, k4: 4, k5: 5}],
            strings: [{k1: "a", k2: "b"}, {k3: "c", k4: "d", k5: "e"}],
            blobs: [{k1: "foo", k2: "bar"}, {k3: "baz", k4: "qux", k5: "quux"}],
            timestamps: [{k1: 1609502096, k2: 1609588496}, {k3: 1609674896, k4: 1609761296, k5: 1609847696}],
            enums: [{k1: "Foo", k2: "Bar"}, {k3: "Baz", k4: "Foo", k5: "Bar"}],
            intEnums: [{k1: 1, k2: 2}, {k3: 3, k4: 1, k5: 2}],
        }
    },
])

apply ListOfMaps @httpResponseTests([
    {
        id: "AwsJson10ListOfMapsDeserialize",
        documentation: "Deserializes lists of maps for all scalar leaf types",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "booleans": [{"k1": true, "k2": false}, {"k3": false, "k4": true, "k5": true}],
                "integers": [{"k1": 1, "k2": 2}, {"k3": 3, "k4": 4, "k5": 5}],
                "strings": [{"k1": "a", "k2": "b"}, {"k3": "c", "k4": "d", "k5": "e"}],
                "blobs": [{"k1": "Zm9v", "k2": "YmFy"}, {"k3": "YmF6", "k4": "cXV4", "k5": "cXV1eA=="}],
                "timestamps": [{"k1": 1609502096, "k2": 1609588496}, {"k3": 1609674896, "k4": 1609761296, "k5": 1609847696}],
                "enums": [{"k1": "Foo", "k2": "Bar"}, {"k3": "Baz", "k4": "Foo", "k5": "Bar"}],
                "intEnums": [{"k1": 1, "k2": 2}, {"k3": 3, "k4": 1, "k5": 2}]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            booleans: [{k1: true, k2: false}, {k3: false, k4: true, k5: true}],
            integers: [{k1: 1, k2: 2}, {k3: 3, k4: 4, k5: 5}],
            strings: [{k1: "a", k2: "b"}, {k3: "c", k4: "d", k5: "e"}],
            blobs: [{k1: "foo", k2: "bar"}, {k3: "baz", k4: "qux", k5: "quux"}],
            timestamps: [{k1: 1609502096, k2: 1609588496}, {k3: 1609674896, k4: 1609761296, k5: 1609847696}],
            enums: [{k1: "Foo", k2: "Bar"}, {k3: "Baz", k4: "Foo", k5: "Bar"}],
            intEnums: [{k1: 1, k2: 2}, {k3: 3, k4: 1, k5: 2}],
        }
    },
])

// =============================================================================
// ListOfLists
// =============================================================================

apply ListOfLists @httpRequestTests([
    {
        id: "AwsJson10ListOfListsSerialize",
        documentation: "Serializes lists of lists for all scalar leaf types",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": [[true, false], [false, true, true]],
                "integers": [[1, 2], [3, 4, 5]],
                "strings": [["a", "b"], ["c", "d", "e"]],
                "blobs": [["Zm9v", "YmFy"], ["YmF6", "cXV4", "cXV1eA=="]],
                "timestamps": [[1609502096, 1609588496], [1609674896, 1609761296, 1609847696]],
                "enums": [["Foo", "Bar"], ["Baz", "Foo", "Bar"]],
                "intEnums": [[1, 2], [3, 1, 2]]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfLists",
        },
        params: {
            booleans: [[true, false], [false, true, true]],
            integers: [[1, 2], [3, 4, 5]],
            strings: [["a", "b"], ["c", "d", "e"]],
            blobs: [["foo", "bar"], ["baz", "qux", "quux"]],
            timestamps: [[1609502096, 1609588496], [1609674896, 1609761296, 1609847696]],
            enums: [["Foo", "Bar"], ["Baz", "Foo", "Bar"]],
            intEnums: [[1, 2], [3, 1, 2]],
        }
    },
])

apply ListOfLists @httpResponseTests([
    {
        id: "AwsJson10ListOfListsDeserialize",
        documentation: "Deserializes lists of lists for all scalar leaf types",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "booleans": [[true, false], [false, true, true]],
                "integers": [[1, 2], [3, 4, 5]],
                "strings": [["a", "b"], ["c", "d", "e"]],
                "blobs": [["Zm9v", "YmFy"], ["YmF6", "cXV4", "cXV1eA=="]],
                "timestamps": [[1609502096, 1609588496], [1609674896, 1609761296, 1609847696]],
                "enums": [["Foo", "Bar"], ["Baz", "Foo", "Bar"]],
                "intEnums": [[1, 2], [3, 1, 2]]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            booleans: [[true, false], [false, true, true]],
            integers: [[1, 2], [3, 4, 5]],
            strings: [["a", "b"], ["c", "d", "e"]],
            blobs: [["foo", "bar"], ["baz", "qux", "quux"]],
            timestamps: [[1609502096, 1609588496], [1609674896, 1609761296, 1609847696]],
            enums: [["Foo", "Bar"], ["Baz", "Foo", "Bar"]],
            intEnums: [[1, 2], [3, 1, 2]],
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
        documentation: "Serializes maps of maps for all scalar leaf types",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": {"first": {"k1": true, "k2": false}, "second": {"k3": false, "k4": true, "k5": true}},
                "integers": {"first": {"k1": 1, "k2": 2}, "second": {"k3": 3, "k4": 4, "k5": 5}},
                "strings": {"first": {"k1": "a", "k2": "b"}, "second": {"k3": "c", "k4": "d", "k5": "e"}},
                "blobs": {"first": {"k1": "Zm9v", "k2": "YmFy"}, "second": {"k3": "YmF6", "k4": "cXV4", "k5": "cXV1eA=="}},
                "timestamps": {"first": {"k1": 1609502096, "k2": 1609588496}, "second": {"k3": 1609674896, "k4": 1609761296, "k5": 1609847696}},
                "enums": {"first": {"k1": "Foo", "k2": "Bar"}, "second": {"k3": "Baz", "k4": "Foo", "k5": "Bar"}},
                "intEnums": {"first": {"k1": 1, "k2": 2}, "second": {"k3": 3, "k4": 1, "k5": 2}}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfMaps",
        },
        params: {
            booleans: {first: {k1: true, k2: false}, second: {k3: false, k4: true, k5: true}},
            integers: {first: {k1: 1, k2: 2}, second: {k3: 3, k4: 4, k5: 5}},
            strings: {first: {k1: "a", k2: "b"}, second: {k3: "c", k4: "d", k5: "e"}},
            blobs: {first: {k1: "foo", k2: "bar"}, second: {k3: "baz", k4: "qux", k5: "quux"}},
            timestamps: {first: {k1: 1609502096, k2: 1609588496}, second: {k3: 1609674896, k4: 1609761296, k5: 1609847696}},
            enums: {first: {k1: "Foo", k2: "Bar"}, second: {k3: "Baz", k4: "Foo", k5: "Bar"}},
            intEnums: {first: {k1: 1, k2: 2}, second: {k3: 3, k4: 1, k5: 2}},
        }
    },
])

apply MapOfMaps @httpResponseTests([
    {
        id: "AwsJson10MapOfMapsDeserialize",
        documentation: "Deserializes maps of maps for all scalar leaf types",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "booleans": {"first": {"k1": true, "k2": false}, "second": {"k3": false, "k4": true, "k5": true}},
                "integers": {"first": {"k1": 1, "k2": 2}, "second": {"k3": 3, "k4": 4, "k5": 5}},
                "strings": {"first": {"k1": "a", "k2": "b"}, "second": {"k3": "c", "k4": "d", "k5": "e"}},
                "blobs": {"first": {"k1": "Zm9v", "k2": "YmFy"}, "second": {"k3": "YmF6", "k4": "cXV4", "k5": "cXV1eA=="}},
                "timestamps": {"first": {"k1": 1609502096, "k2": 1609588496}, "second": {"k3": 1609674896, "k4": 1609761296, "k5": 1609847696}},
                "enums": {"first": {"k1": "Foo", "k2": "Bar"}, "second": {"k3": "Baz", "k4": "Foo", "k5": "Bar"}},
                "intEnums": {"first": {"k1": 1, "k2": 2}, "second": {"k3": 3, "k4": 1, "k5": 2}}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            booleans: {first: {k1: true, k2: false}, second: {k3: false, k4: true, k5: true}},
            integers: {first: {k1: 1, k2: 2}, second: {k3: 3, k4: 4, k5: 5}},
            strings: {first: {k1: "a", k2: "b"}, second: {k3: "c", k4: "d", k5: "e"}},
            blobs: {first: {k1: "foo", k2: "bar"}, second: {k3: "baz", k4: "qux", k5: "quux"}},
            timestamps: {first: {k1: 1609502096, k2: 1609588496}, second: {k3: 1609674896, k4: 1609761296, k5: 1609847696}},
            enums: {first: {k1: "Foo", k2: "Bar"}, second: {k3: "Baz", k4: "Foo", k5: "Bar"}},
            intEnums: {first: {k1: 1, k2: 2}, second: {k3: 3, k4: 1, k5: 2}},
        }
    },
])

// =============================================================================
// MapOfLists
// =============================================================================

apply MapOfLists @httpRequestTests([
    {
        id: "AwsJson10MapOfListsSerialize",
        documentation: "Serializes maps of lists for all scalar leaf types",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": {"first": [true, false], "second": [false, true, true]},
                "integers": {"first": [1, 2], "second": [3, 4, 5]},
                "strings": {"first": ["a", "b"], "second": ["c", "d", "e"]},
                "blobs": {"first": ["Zm9v", "YmFy"], "second": ["YmF6", "cXV4", "cXV1eA=="]},
                "timestamps": {"first": [1609502096, 1609588496], "second": [1609674896, 1609761296, 1609847696]},
                "enums": {"first": ["Foo", "Bar"], "second": ["Baz", "Foo", "Bar"]},
                "intEnums": {"first": [1, 2], "second": [3, 1, 2]}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfLists",
        },
        params: {
            booleans: {first: [true, false], second: [false, true, true]},
            integers: {first: [1, 2], second: [3, 4, 5]},
            strings: {first: ["a", "b"], second: ["c", "d", "e"]},
            blobs: {first: ["foo", "bar"], second: ["baz", "qux", "quux"]},
            timestamps: {first: [1609502096, 1609588496], second: [1609674896, 1609761296, 1609847696]},
            enums: {first: ["Foo", "Bar"], second: ["Baz", "Foo", "Bar"]},
            intEnums: {first: [1, 2], second: [3, 1, 2]},
        }
    },
])

apply MapOfLists @httpResponseTests([
    {
        id: "AwsJson10MapOfListsDeserialize",
        documentation: "Deserializes maps of lists for all scalar leaf types",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "booleans": {"first": [true, false], "second": [false, true, true]},
                "integers": {"first": [1, 2], "second": [3, 4, 5]},
                "strings": {"first": ["a", "b"], "second": ["c", "d", "e"]},
                "blobs": {"first": ["Zm9v", "YmFy"], "second": ["YmF6", "cXV4", "cXV1eA=="]},
                "timestamps": {"first": [1609502096, 1609588496], "second": [1609674896, 1609761296, 1609847696]},
                "enums": {"first": ["Foo", "Bar"], "second": ["Baz", "Foo", "Bar"]},
                "intEnums": {"first": [1, 2], "second": [3, 1, 2]}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            booleans: {first: [true, false], second: [false, true, true]},
            integers: {first: [1, 2], second: [3, 4, 5]},
            strings: {first: ["a", "b"], second: ["c", "d", "e"]},
            blobs: {first: ["foo", "bar"], second: ["baz", "qux", "quux"]},
            timestamps: {first: [1609502096, 1609588496], second: [1609674896, 1609761296, 1609847696]},
            enums: {first: ["Foo", "Bar"], second: ["Baz", "Foo", "Bar"]},
            intEnums: {first: [1, 2], second: [3, 1, 2]},
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
