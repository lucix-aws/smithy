$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_1
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// ListOfScalars
// =============================================================================

apply ListOfScalars @httpRequestTests([
    {
        id: "AwsJson11ListOfScalarsPopulated",
        documentation: "Serializes all scalar list types",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": [true, false],
                "integers": [1, 2, 3],
                "strings": ["foo", "bar"],
                "blobs": ["Zm9v", "YmFy"],
                "timestamps": [1609459200, 1609545600],
                "enums": ["Foo", "Bar"],
                "intEnums": [1, 2]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfScalars",
        },
        params: {
            booleans: [true, false],
            integers: [1, 2, 3],
            strings: ["foo", "bar"],
            blobs: ["foo", "bar"],
            timestamps: [1609459200, 1609545600],
            enums: ["Foo", "Bar"],
            intEnums: [1, 2],
        }
    },
    {
        id: "AwsJson11ListOfScalarsEmpty",
        tags: ["empty"],
        documentation: "Serializes empty lists",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": [],
                "integers": [],
                "strings": [],
                "blobs": [],
                "timestamps": [],
                "enums": [],
                "intEnums": []
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfScalars",
        },
        params: {
            booleans: [],
            integers: [],
            strings: [],
            blobs: [],
            timestamps: [],
            enums: [],
            intEnums: [],
        }
    },
])

apply ListOfScalars @httpResponseTests([
    {
        id: "AwsJson11ListOfScalarsPopulatedResponse",
        documentation: "Deserializes all scalar list types",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": [true, false],
                "integers": [1, 2, 3],
                "strings": ["foo", "bar"],
                "blobs": ["Zm9v", "YmFy"],
                "timestamps": [1609459200, 1609545600],
                "enums": ["Foo", "Bar"],
                "intEnums": [1, 2]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: [true, false],
            integers: [1, 2, 3],
            strings: ["foo", "bar"],
            blobs: ["foo", "bar"],
            timestamps: [1609459200, 1609545600],
            enums: ["Foo", "Bar"],
            intEnums: [1, 2],
        }
    },
    {
        id: "AwsJson11ListOfScalarsEmptyResponse",
        tags: ["empty"],
        documentation: "Deserializes empty lists",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": [],
                "integers": [],
                "strings": [],
                "blobs": [],
                "timestamps": [],
                "enums": [],
                "intEnums": []
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: [],
            integers: [],
            strings: [],
            blobs: [],
            timestamps: [],
            enums: [],
            intEnums: [],
        }
    },
])

// =============================================================================
// SparseListOfScalars
// =============================================================================

apply SparseListOfScalars @httpRequestTests([
    {
        id: "AwsJson11SparseListOfScalarsWithNulls",
        documentation: "Serializes sparse lists with null values interspersed",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "strings": ["foo", null, "bar"],
                "integers": [1, null, 3]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseListOfScalars",
        },
        params: {
            strings: ["foo", null, "bar"],
            integers: [1, null, 3],
        }
    },
])

apply SparseListOfScalars @httpResponseTests([
    {
        id: "AwsJson11SparseListOfScalarsWithNullsResponse",
        documentation: "Deserializes sparse lists with null values interspersed",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "strings": ["foo", null, "bar"],
                "integers": [1, null, 3]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            strings: ["foo", null, "bar"],
            integers: [1, null, 3],
        }
    },
])

// =============================================================================
// MapOfScalars
// =============================================================================

apply MapOfScalars @httpRequestTests([
    {
        id: "AwsJson11MapOfScalarsPopulated",
        documentation: "Serializes all scalar map types",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": {"a": true, "b": false},
                "integers": {"a": 1, "b": 2},
                "strings": {"a": "foo", "b": "bar"},
                "blobs": {"a": "Zm9v", "b": "YmFy"},
                "timestamps": {"a": 1609459200, "b": 1609545600},
                "enums": {"a": "Foo", "b": "Bar"},
                "intEnums": {"a": 1, "b": 2}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfScalars",
        },
        params: {
            booleans: { a: true, b: false },
            integers: { a: 1, b: 2 },
            strings: { a: "foo", b: "bar" },
            blobs: { a: "foo", b: "bar" },
            timestamps: { a: 1609459200, b: 1609545600 },
            enums: { a: "Foo", b: "Bar" },
            intEnums: { a: 1, b: 2 },
        }
    },
    {
        id: "AwsJson11MapOfScalarsEmpty",
        tags: ["empty"],
        documentation: "Serializes empty maps",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": {},
                "integers": {},
                "strings": {},
                "blobs": {},
                "timestamps": {},
                "enums": {},
                "intEnums": {}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfScalars",
        },
        params: {
            booleans: {},
            integers: {},
            strings: {},
            blobs: {},
            timestamps: {},
            enums: {},
            intEnums: {},
        }
    },
])

apply MapOfScalars @httpResponseTests([
    {
        id: "AwsJson11MapOfScalarsPopulatedResponse",
        documentation: "Deserializes all scalar map types",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": {"a": true, "b": false},
                "integers": {"a": 1, "b": 2},
                "strings": {"a": "foo", "b": "bar"},
                "blobs": {"a": "Zm9v", "b": "YmFy"},
                "timestamps": {"a": 1609459200, "b": 1609545600},
                "enums": {"a": "Foo", "b": "Bar"},
                "intEnums": {"a": 1, "b": 2}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: { a: true, b: false },
            integers: { a: 1, b: 2 },
            strings: { a: "foo", b: "bar" },
            blobs: { a: "foo", b: "bar" },
            timestamps: { a: 1609459200, b: 1609545600 },
            enums: { a: "Foo", b: "Bar" },
            intEnums: { a: 1, b: 2 },
        }
    },
    {
        id: "AwsJson11MapOfScalarsEmptyResponse",
        tags: ["empty"],
        documentation: "Deserializes empty maps",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": {},
                "integers": {},
                "strings": {},
                "blobs": {},
                "timestamps": {},
                "enums": {},
                "intEnums": {}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: {},
            integers: {},
            strings: {},
            blobs: {},
            timestamps: {},
            enums: {},
            intEnums: {},
        }
    },
])

// =============================================================================
// SparseMapOfScalars
// =============================================================================

apply SparseMapOfScalars @httpRequestTests([
    {
        id: "AwsJson11SparseMapOfScalarsWithNulls",
        documentation: "Serializes sparse maps with null values",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "strings": {"a": "foo", "b": null, "c": "bar"},
                "integers": {"a": 1, "b": null, "c": 3}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseMapOfScalars",
        },
        params: {
            strings: { a: "foo", b: null, c: "bar" },
            integers: { a: 1, b: null, c: 3 },
        }
    },
])

apply SparseMapOfScalars @httpResponseTests([
    {
        id: "AwsJson11SparseMapOfScalarsWithNullsResponse",
        documentation: "Deserializes sparse maps with null values",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "strings": {"a": "foo", "b": null, "c": "bar"},
                "integers": {"a": 1, "b": null, "c": 3}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            strings: { a: "foo", b: null, c: "bar" },
            integers: { a: 1, b: null, c: 3 },
        }
    },
])

// =============================================================================
// StructOfScalars
// =============================================================================

apply StructOfScalars @httpRequestTests([
    {
        id: "AwsJson11StructOfScalarsPopulated",
        documentation: "Serializes a fully populated nested struct",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "booleanMember": true,
                    "byteMember": 5,
                    "shortMember": 256,
                    "integerMember": 1234,
                    "longMember": 999999999999,
                    "floatMember": 1.5,
                    "doubleMember": 2.5,
                    "stringMember": "hello",
                    "mediaTypeMember": "{\\\"nested\\\":true}",
                    "blobMember": "Zm9v",
                    "dateTimeMember": "2021-01-01T00:00:00Z",
                    "epochSecondsMember": 1609459200,
                    "httpDateMember": "Fri, 01 Jan 2021 00:00:00 GMT",
                    "stringEnum": "Foo",
                    "intEnum": 1
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.StructOfScalars",
        },
        params: {
            value: {
                booleanMember: true,
                byteMember: 5,
                shortMember: 256,
                integerMember: 1234,
                longMember: 999999999999,
                floatMember: 1.5,
                doubleMember: 2.5,
                stringMember: "hello",
                mediaTypeMember: "{\"nested\":true}",
                blobMember: "foo",
                dateTimeMember: 1609459200,
                epochSecondsMember: 1609459200,
                httpDateMember: 1609459200,
                stringEnum: "Foo",
                intEnum: 1,
            }
        }
    },
])

apply StructOfScalars @httpResponseTests([
    {
        id: "AwsJson11StructOfScalarsPopulatedResponse",
        documentation: "Deserializes a fully populated nested struct",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "booleanMember": true,
                    "byteMember": 5,
                    "shortMember": 256,
                    "integerMember": 1234,
                    "longMember": 999999999999,
                    "floatMember": 1.5,
                    "doubleMember": 2.5,
                    "stringMember": "hello",
                    "mediaTypeMember": "{\\\"nested\\\":true}",
                    "blobMember": "Zm9v",
                    "dateTimeMember": "2021-01-01T00:00:00Z",
                    "epochSecondsMember": 1609459200,
                    "httpDateMember": "Fri, 01 Jan 2021 00:00:00 GMT",
                    "stringEnum": "Foo",
                    "intEnum": 1
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                booleanMember: true,
                byteMember: 5,
                shortMember: 256,
                integerMember: 1234,
                longMember: 999999999999,
                floatMember: 1.5,
                doubleMember: 2.5,
                stringMember: "hello",
                mediaTypeMember: "{\"nested\":true}",
                blobMember: "foo",
                dateTimeMember: 1609459200,
                epochSecondsMember: 1609459200,
                httpDateMember: 1609459200,
                stringEnum: "Foo",
                intEnum: 1,
            }
        }
    },
])
