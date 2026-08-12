$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_1
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

apply ScalarMembers @httpRequestTests([
    {
        id: "AwsJson11ScalarMembersSerialize",
        documentation: "Serializes all scalar members",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleanMember": true,
                "byteMember": 5,
                "shortMember": 256,
                "integerMember": 1234,
                "longMember": 999999999999,
                "floatMember": 1.5,
                "doubleMember": 2.5,
                "stringMember": "hello",
                "blobMember": "Zm9v",
                "dateTimeMember": "2021-01-01T00:00:00Z",
                "epochSecondsMember": 1609459200,
                "httpDateMember": "Fri, 01 Jan 2021 00:00:00 GMT",
                "stringEnum": "Foo",
                "intEnum": 1,
                "mediaTypeMember": "{\\\"nested\\\":true}"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ScalarMembers",
        },
        params: {
            booleanMember: true,
            byteMember: 5,
            shortMember: 256,
            integerMember: 1234,
            longMember: 999999999999,
            floatMember: 1.5,
            doubleMember: 2.5,
            stringMember: "hello",
            blobMember: "foo",
            dateTimeMember: 1609459200,
            epochSecondsMember: 1609459200,
            httpDateMember: 1609459200,
            stringEnum: "Foo",
            intEnum: 1,
            mediaTypeMember: "{\"nested\":true}",
        }
    },
    {
        id: "AwsJson11ScalarMembersSerializeZeroValues",
        documentation: "Serializes zero/false/empty scalar values",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleanMember": false,
                "byteMember": 0,
                "shortMember": 0,
                "integerMember": 0,
                "longMember": 0,
                "floatMember": 0,
                "doubleMember": 0,
                "stringMember": ""
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ScalarMembers",
        },
        params: {
            booleanMember: false,
            byteMember: 0,
            shortMember: 0,
            integerMember: 0,
            longMember: 0,
            floatMember: 0,
            doubleMember: 0,
            stringMember: "",
        }
    },
    {
        id: "AwsJson11ScalarMembersNaN",
        tags: ["non-finite-floats"],
        documentation: "Serializes NaN float values",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "floatMember": "NaN",
                "doubleMember": "NaN"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ScalarMembers",
        },
        params: {
            floatMember: "NaN",
            doubleMember: "NaN",
        }
    },
    {
        id: "AwsJson11ScalarMembersInfinity",
        tags: ["non-finite-floats"],
        documentation: "Serializes Infinity float values",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "floatMember": "Infinity",
                "doubleMember": "Infinity"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ScalarMembers",
        },
        params: {
            floatMember: "Infinity",
            doubleMember: "Infinity",
        }
    },
    {
        id: "AwsJson11ScalarMembersNegativeInfinity",
        tags: ["non-finite-floats"],
        documentation: "Serializes -Infinity float values",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "floatMember": "-Infinity",
                "doubleMember": "-Infinity"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ScalarMembers",
        },
        params: {
            floatMember: "-Infinity",
            doubleMember: "-Infinity",
        }
    },
    {
        id: "AwsJson11ScalarMembersIgnoresJsonName",
        documentation: "awsJson1_1 ignores @jsonName and uses the member name",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "stringMember": "hello"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ScalarMembers",
        },
        params: {
            stringMember: "hello",
        }
    },
    {
        id: "AwsJson11ScalarMembersOmitsNullValues",
        tags: ["null-on-wire"],
        documentation: "Non-sparse struct members that are null are omitted",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "stringMember": "only this"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ScalarMembers",
        },
        params: {
            stringMember: "only this",
        }
    },
])

apply ScalarMembers @httpResponseTests([
    {
        id: "AwsJson11ScalarMembersDeserialize",
        documentation: "Deserializes all scalar members",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleanMember": true,
                "byteMember": 5,
                "shortMember": 256,
                "integerMember": 1234,
                "longMember": 999999999999,
                "floatMember": 1.5,
                "doubleMember": 2.5,
                "stringMember": "hello",
                "blobMember": "Zm9v",
                "dateTimeMember": "2021-01-01T00:00:00Z",
                "epochSecondsMember": 1609459200,
                "httpDateMember": "Fri, 01 Jan 2021 00:00:00 GMT",
                "stringEnum": "Foo",
                "intEnum": 1,
                "mediaTypeMember": "{\\\"nested\\\":true}"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleanMember: true,
            byteMember: 5,
            shortMember: 256,
            integerMember: 1234,
            longMember: 999999999999,
            floatMember: 1.5,
            doubleMember: 2.5,
            stringMember: "hello",
            blobMember: "foo",
            dateTimeMember: 1609459200,
            epochSecondsMember: 1609459200,
            httpDateMember: 1609459200,
            stringEnum: "Foo",
            intEnum: 1,
            mediaTypeMember: "{\"nested\":true}",
        }
    },
    {
        id: "AwsJson11ScalarMembersDeserializeNaN",
        tags: ["non-finite-floats"],
        documentation: "Deserializes NaN float values",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "floatMember": "NaN",
                "doubleMember": "NaN"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            floatMember: "NaN",
            doubleMember: "NaN",
        }
    },
    {
        id: "AwsJson11ScalarMembersDeserializeZeroValues",
        documentation: "Deserializes zero/false/empty scalar values",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleanMember": false,
                "byteMember": 0,
                "shortMember": 0,
                "integerMember": 0,
                "longMember": 0,
                "floatMember": 0,
                "doubleMember": 0,
                "stringMember": ""
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleanMember: false,
            byteMember: 0,
            shortMember: 0,
            integerMember: 0,
            longMember: 0,
            floatMember: 0,
            doubleMember: 0,
            stringMember: "",
        }
    },
    {
        id: "AwsJson11ScalarMembersDeserializeInfinity",
        tags: ["non-finite-floats"],
        documentation: "Deserializes Infinity float values",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "floatMember": "Infinity",
                "doubleMember": "Infinity"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            floatMember: "Infinity",
            doubleMember: "Infinity",
        }
    },
    {
        id: "AwsJson11ScalarMembersDeserializeNegativeInfinity",
        tags: ["non-finite-floats"],
        documentation: "Deserializes -Infinity float values",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "floatMember": "-Infinity",
                "doubleMember": "-Infinity"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            floatMember: "-Infinity",
            doubleMember: "-Infinity",
        }
    },
    {
        id: "AwsJson11ScalarMembersDeserializeIgnoresNullValues",
        tags: ["null-on-wire"],
        documentation: "Client drops a wire null for a dense struct member",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "stringMember": "only this",
                "integerMember": null,
                "booleanMember": null
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        appliesTo: "client",
        params: {
            stringMember: "only this",
        }
    },
    {
        id: "AwsJson11ScalarMembersDeserializeIgnoresUnknownFields",
        tags: ["unknown-fields"],
        documentation: "Client ignores unrecognized fields in the response",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "stringMember": "hello",
                "unknownField": "ignored",
                "anotherUnknown": 42
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        appliesTo: "client",
        params: {
            stringMember: "hello",
        }
    },
])

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
                "bytes": [5, 6],
                "shorts": [256, 257],
                "integers": [1, 2, 3],
                "longs": [999999999999, 999999999998],
                "floats": [1.5, 2.5],
                "doubles": [3.5, 4.5],
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
            bytes: [5, 6],
            shorts: [256, 257],
            integers: [1, 2, 3],
            longs: [999999999999, 999999999998],
            floats: [1.5, 2.5],
            doubles: [3.5, 4.5],
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
                "bytes": [],
                "shorts": [],
                "integers": [],
                "longs": [],
                "floats": [],
                "doubles": [],
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
            bytes: [],
            shorts: [],
            integers: [],
            longs: [],
            floats: [],
            doubles: [],
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
                "bytes": [5, 6],
                "shorts": [256, 257],
                "integers": [1, 2, 3],
                "longs": [999999999999, 999999999998],
                "floats": [1.5, 2.5],
                "doubles": [3.5, 4.5],
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
            bytes: [5, 6],
            shorts: [256, 257],
            integers: [1, 2, 3],
            longs: [999999999999, 999999999998],
            floats: [1.5, 2.5],
            doubles: [3.5, 4.5],
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
                "bytes": [],
                "shorts": [],
                "integers": [],
                "longs": [],
                "floats": [],
                "doubles": [],
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
            bytes: [],
            shorts: [],
            integers: [],
            longs: [],
            floats: [],
            doubles: [],
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
//
// Base case rule: sparse collections carry 3 unique non-null-position elements
// (2 non-null + 1 null), and null position (beginning/middle/end) is covered
// across the corpus rather than always defaulting to the middle. This uses 3
// request + 3 response cases, one per null position, covering all 13 scalar
// types in each.
// =============================================================================

apply SparseListOfScalars @httpRequestTests([
    {
        id: "AwsJson11SparseListOfScalarsNullAtStart",
        documentation: "Serializes sparse lists with a null as the first element",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": [null, true, false],
                "bytes": [null, 5, 6],
                "shorts": [null, 256, 257],
                "integers": [null, 1, 2],
                "longs": [null, 999999999999, 999999999998],
                "floats": [null, 1.5, 2.5],
                "doubles": [null, 3.5, 4.5],
                "strings": [null, "foo", "bar"],
                "blobs": [null, "Zm9v", "YmFy"],
                "timestamps": [null, 1609459200, 1609545600],
                "enums": [null, "Foo", "Bar"],
                "intEnums": [null, 1, 2]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseListOfScalars",
        },
        params: {
            booleans: [null, true, false],
            bytes: [null, 5, 6],
            shorts: [null, 256, 257],
            integers: [null, 1, 2],
            longs: [null, 999999999999, 999999999998],
            floats: [null, 1.5, 2.5],
            doubles: [null, 3.5, 4.5],
            strings: [null, "foo", "bar"],
            blobs: [null, "foo", "bar"],
            timestamps: [null, 1609459200, 1609545600],
            enums: [null, "Foo", "Bar"],
            intEnums: [null, 1, 2],
        }
    },
    {
        id: "AwsJson11SparseListOfScalarsNullInMiddle",
        documentation: "Serializes sparse lists with a null as the middle element",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": [true, null, false],
                "bytes": [5, null, 6],
                "shorts": [256, null, 257],
                "integers": [1, null, 2],
                "longs": [999999999999, null, 999999999998],
                "floats": [1.5, null, 2.5],
                "doubles": [3.5, null, 4.5],
                "strings": ["foo", null, "bar"],
                "blobs": ["Zm9v", null, "YmFy"],
                "timestamps": [null, 1609459200, 1609545600],
                "enums": ["Foo", null, "Bar"],
                "intEnums": [1, null, 2]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseListOfScalars",
        },
        params: {
            booleans: [true, null, false],
            bytes: [5, null, 6],
            shorts: [256, null, 257],
            integers: [1, null, 2],
            longs: [999999999999, null, 999999999998],
            floats: [1.5, null, 2.5],
            doubles: [3.5, null, 4.5],
            strings: ["foo", null, "bar"],
            blobs: ["foo", null, "bar"],
            timestamps: [null, 1609459200, 1609545600],
            enums: ["Foo", null, "Bar"],
            intEnums: [1, null, 2],
        }
    },
    {
        id: "AwsJson11SparseListOfScalarsNullAtEnd",
        documentation: "Serializes sparse lists with a null as the last element",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": [true, false, null],
                "bytes": [5, 6, null],
                "shorts": [256, 257, null],
                "integers": [1, 2, null],
                "longs": [999999999999, 999999999998, null],
                "floats": [1.5, 2.5, null],
                "doubles": [3.5, 4.5, null],
                "strings": ["foo", "bar", null],
                "blobs": ["Zm9v", "YmFy", null],
                "timestamps": [null, 1609459200, 1609545600],
                "enums": ["Foo", "Bar", null],
                "intEnums": [1, 2, null]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseListOfScalars",
        },
        params: {
            booleans: [true, false, null],
            bytes: [5, 6, null],
            shorts: [256, 257, null],
            integers: [1, 2, null],
            longs: [999999999999, 999999999998, null],
            floats: [1.5, 2.5, null],
            doubles: [3.5, 4.5, null],
            strings: ["foo", "bar", null],
            blobs: ["foo", "bar", null],
            timestamps: [null, 1609459200, 1609545600],
            enums: ["Foo", "Bar", null],
            intEnums: [1, 2, null],
        }
    },
])

apply SparseListOfScalars @httpResponseTests([
    {
        id: "AwsJson11SparseListOfScalarsNullAtStartResponse",
        documentation: "Deserializes sparse lists with a null as the first element",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": [null, true, false],
                "bytes": [null, 5, 6],
                "shorts": [null, 256, 257],
                "integers": [null, 1, 2],
                "longs": [null, 999999999999, 999999999998],
                "floats": [null, 1.5, 2.5],
                "doubles": [null, 3.5, 4.5],
                "strings": [null, "foo", "bar"],
                "blobs": [null, "Zm9v", "YmFy"],
                "timestamps": [null, 1609459200, 1609545600],
                "enums": [null, "Foo", "Bar"],
                "intEnums": [null, 1, 2]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: [null, true, false],
            bytes: [null, 5, 6],
            shorts: [null, 256, 257],
            integers: [null, 1, 2],
            longs: [null, 999999999999, 999999999998],
            floats: [null, 1.5, 2.5],
            doubles: [null, 3.5, 4.5],
            strings: [null, "foo", "bar"],
            blobs: [null, "foo", "bar"],
            timestamps: [null, 1609459200, 1609545600],
            enums: [null, "Foo", "Bar"],
            intEnums: [null, 1, 2],
        }
    },
    {
        id: "AwsJson11SparseListOfScalarsNullInMiddleResponse",
        documentation: "Deserializes sparse lists with a null as the middle element",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": [true, null, false],
                "bytes": [5, null, 6],
                "shorts": [256, null, 257],
                "integers": [1, null, 2],
                "longs": [999999999999, null, 999999999998],
                "floats": [1.5, null, 2.5],
                "doubles": [3.5, null, 4.5],
                "strings": ["foo", null, "bar"],
                "blobs": ["Zm9v", null, "YmFy"],
                "timestamps": [null, 1609459200, 1609545600],
                "enums": ["Foo", null, "Bar"],
                "intEnums": [1, null, 2]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: [true, null, false],
            bytes: [5, null, 6],
            shorts: [256, null, 257],
            integers: [1, null, 2],
            longs: [999999999999, null, 999999999998],
            floats: [1.5, null, 2.5],
            doubles: [3.5, null, 4.5],
            strings: ["foo", null, "bar"],
            blobs: ["foo", null, "bar"],
            timestamps: [null, 1609459200, 1609545600],
            enums: ["Foo", null, "Bar"],
            intEnums: [1, null, 2],
        }
    },
    {
        id: "AwsJson11SparseListOfScalarsNullAtEndResponse",
        documentation: "Deserializes sparse lists with a null as the last element",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": [true, false, null],
                "bytes": [5, 6, null],
                "shorts": [256, 257, null],
                "integers": [1, 2, null],
                "longs": [999999999999, 999999999998, null],
                "floats": [1.5, 2.5, null],
                "doubles": [3.5, 4.5, null],
                "strings": ["foo", "bar", null],
                "blobs": ["Zm9v", "YmFy", null],
                "timestamps": [null, 1609459200, 1609545600],
                "enums": ["Foo", "Bar", null],
                "intEnums": [1, 2, null]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: [true, false, null],
            bytes: [5, 6, null],
            shorts: [256, 257, null],
            integers: [1, 2, null],
            longs: [999999999999, 999999999998, null],
            floats: [1.5, 2.5, null],
            doubles: [3.5, 4.5, null],
            strings: ["foo", "bar", null],
            blobs: ["foo", "bar", null],
            timestamps: [null, 1609459200, 1609545600],
            enums: ["Foo", "Bar", null],
            intEnums: [1, 2, null],
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
                "bytes": {"a": 5, "b": 6},
                "shorts": {"a": 256, "b": 257},
                "integers": {"a": 1, "b": 2},
                "longs": {"a": 999999999999, "b": 999999999998},
                "floats": {"a": 1.5, "b": 2.5},
                "doubles": {"a": 3.5, "b": 4.5},
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
            bytes: { a: 5, b: 6 },
            shorts: { a: 256, b: 257 },
            integers: { a: 1, b: 2 },
            longs: { a: 999999999999, b: 999999999998 },
            floats: { a: 1.5, b: 2.5 },
            doubles: { a: 3.5, b: 4.5 },
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
                "bytes": {},
                "shorts": {},
                "integers": {},
                "longs": {},
                "floats": {},
                "doubles": {},
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
            bytes: {},
            shorts: {},
            integers: {},
            longs: {},
            floats: {},
            doubles: {},
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
                "bytes": {"a": 5, "b": 6},
                "shorts": {"a": 256, "b": 257},
                "integers": {"a": 1, "b": 2},
                "longs": {"a": 999999999999, "b": 999999999998},
                "floats": {"a": 1.5, "b": 2.5},
                "doubles": {"a": 3.5, "b": 4.5},
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
            bytes: { a: 5, b: 6 },
            shorts: { a: 256, b: 257 },
            integers: { a: 1, b: 2 },
            longs: { a: 999999999999, b: 999999999998 },
            floats: { a: 1.5, b: 2.5 },
            doubles: { a: 3.5, b: 4.5 },
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
                "bytes": {},
                "shorts": {},
                "integers": {},
                "longs": {},
                "floats": {},
                "doubles": {},
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
            bytes: {},
            shorts: {},
            integers: {},
            longs: {},
            floats: {},
            doubles: {},
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
//
// Same null-position coverage as SparseListOfScalars: 3 request + 3 response
// cases (start/middle/end), all 13 scalar types, 2 non-null keys + 1 null key
// per case.
// =============================================================================

apply SparseMapOfScalars @httpRequestTests([
    {
        id: "AwsJson11SparseMapOfScalarsNullAtStart",
        documentation: "Serializes sparse maps with a null as the first entry",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": {"a": null, "b": true, "c": false},
                "bytes": {"a": null, "b": 5, "c": 6},
                "shorts": {"a": null, "b": 256, "c": 257},
                "integers": {"a": null, "b": 1, "c": 2},
                "longs": {"a": null, "b": 999999999999, "c": 999999999998},
                "floats": {"a": null, "b": 1.5, "c": 2.5},
                "doubles": {"a": null, "b": 3.5, "c": 4.5},
                "strings": {"a": null, "b": "foo", "c": "bar"},
                "blobs": {"a": null, "b": "Zm9v", "c": "YmFy"},
                "timestamps": {"a": null, "b": 1609459200, "c": 1609545600},
                "enums": {"a": null, "b": "Foo", "c": "Bar"},
                "intEnums": {"a": null, "b": 1, "c": 2}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseMapOfScalars",
        },
        params: {
            booleans: { a: null, b: true, c: false },
            bytes: { a: null, b: 5, c: 6 },
            shorts: { a: null, b: 256, c: 257 },
            integers: { a: null, b: 1, c: 2 },
            longs: { a: null, b: 999999999999, c: 999999999998 },
            floats: { a: null, b: 1.5, c: 2.5 },
            doubles: { a: null, b: 3.5, c: 4.5 },
            strings: { a: null, b: "foo", c: "bar" },
            blobs: { a: null, b: "foo", c: "bar" },
            timestamps: { a: null, b: 1609459200, c: 1609545600 },
            enums: { a: null, b: "Foo", c: "Bar" },
            intEnums: { a: null, b: 1, c: 2 },
        }
    },
    {
        id: "AwsJson11SparseMapOfScalarsNullInMiddle",
        documentation: "Serializes sparse maps with a null as the middle entry",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": {"a": true, "b": null, "c": false},
                "bytes": {"a": 5, "b": null, "c": 6},
                "shorts": {"a": 256, "b": null, "c": 257},
                "integers": {"a": 1, "b": null, "c": 2},
                "longs": {"a": 999999999999, "b": null, "c": 999999999998},
                "floats": {"a": 1.5, "b": null, "c": 2.5},
                "doubles": {"a": 3.5, "b": null, "c": 4.5},
                "strings": {"a": "foo", "b": null, "c": "bar"},
                "blobs": {"a": "Zm9v", "b": null, "c": "YmFy"},
                "timestamps": {"a": 1609459200, "b": null, "c": 1609545600},
                "enums": {"a": "Foo", "b": null, "c": "Bar"},
                "intEnums": {"a": 1, "b": null, "c": 2}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseMapOfScalars",
        },
        params: {
            booleans: { a: true, b: null, c: false },
            bytes: { a: 5, b: null, c: 6 },
            shorts: { a: 256, b: null, c: 257 },
            integers: { a: 1, b: null, c: 2 },
            longs: { a: 999999999999, b: null, c: 999999999998 },
            floats: { a: 1.5, b: null, c: 2.5 },
            doubles: { a: 3.5, b: null, c: 4.5 },
            strings: { a: "foo", b: null, c: "bar" },
            blobs: { a: "foo", b: null, c: "bar" },
            timestamps: { a: 1609459200, b: null, c: 1609545600 },
            enums: { a: "Foo", b: null, c: "Bar" },
            intEnums: { a: 1, b: null, c: 2 },
        }
    },
    {
        id: "AwsJson11SparseMapOfScalarsNullAtEnd",
        documentation: "Serializes sparse maps with a null as the last entry",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "booleans": {"a": true, "b": false, "c": null},
                "bytes": {"a": 5, "b": 6, "c": null},
                "shorts": {"a": 256, "b": 257, "c": null},
                "integers": {"a": 1, "b": 2, "c": null},
                "longs": {"a": 999999999999, "b": 999999999998, "c": null},
                "floats": {"a": 1.5, "b": 2.5, "c": null},
                "doubles": {"a": 3.5, "b": 4.5, "c": null},
                "strings": {"a": "foo", "b": "bar", "c": null},
                "blobs": {"a": "Zm9v", "b": "YmFy", "c": null},
                "timestamps": {"a": 1609459200, "b": 1609545600, "c": null},
                "enums": {"a": "Foo", "b": "Bar", "c": null},
                "intEnums": {"a": 1, "b": 2, "c": null}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.SparseMapOfScalars",
        },
        params: {
            booleans: { a: true, b: false, c: null },
            bytes: { a: 5, b: 6, c: null },
            shorts: { a: 256, b: 257, c: null },
            integers: { a: 1, b: 2, c: null },
            longs: { a: 999999999999, b: 999999999998, c: null },
            floats: { a: 1.5, b: 2.5, c: null },
            doubles: { a: 3.5, b: 4.5, c: null },
            strings: { a: "foo", b: "bar", c: null },
            blobs: { a: "foo", b: "bar", c: null },
            timestamps: { a: 1609459200, b: 1609545600, c: null },
            enums: { a: "Foo", b: "Bar", c: null },
            intEnums: { a: 1, b: 2, c: null },
        }
    },
])

apply SparseMapOfScalars @httpResponseTests([
    {
        id: "AwsJson11SparseMapOfScalarsNullAtStartResponse",
        documentation: "Deserializes sparse maps with a null as the first entry",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": {"a": null, "b": true, "c": false},
                "bytes": {"a": null, "b": 5, "c": 6},
                "shorts": {"a": null, "b": 256, "c": 257},
                "integers": {"a": null, "b": 1, "c": 2},
                "longs": {"a": null, "b": 999999999999, "c": 999999999998},
                "floats": {"a": null, "b": 1.5, "c": 2.5},
                "doubles": {"a": null, "b": 3.5, "c": 4.5},
                "strings": {"a": null, "b": "foo", "c": "bar"},
                "blobs": {"a": null, "b": "Zm9v", "c": "YmFy"},
                "timestamps": {"a": null, "b": 1609459200, "c": 1609545600},
                "enums": {"a": null, "b": "Foo", "c": "Bar"},
                "intEnums": {"a": null, "b": 1, "c": 2}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: { a: null, b: true, c: false },
            bytes: { a: null, b: 5, c: 6 },
            shorts: { a: null, b: 256, c: 257 },
            integers: { a: null, b: 1, c: 2 },
            longs: { a: null, b: 999999999999, c: 999999999998 },
            floats: { a: null, b: 1.5, c: 2.5 },
            doubles: { a: null, b: 3.5, c: 4.5 },
            strings: { a: null, b: "foo", c: "bar" },
            blobs: { a: null, b: "foo", c: "bar" },
            timestamps: { a: null, b: 1609459200, c: 1609545600 },
            enums: { a: null, b: "Foo", c: "Bar" },
            intEnums: { a: null, b: 1, c: 2 },
        }
    },
    {
        id: "AwsJson11SparseMapOfScalarsNullInMiddleResponse",
        documentation: "Deserializes sparse maps with a null as the middle entry",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": {"a": true, "b": null, "c": false},
                "bytes": {"a": 5, "b": null, "c": 6},
                "shorts": {"a": 256, "b": null, "c": 257},
                "integers": {"a": 1, "b": null, "c": 2},
                "longs": {"a": 999999999999, "b": null, "c": 999999999998},
                "floats": {"a": 1.5, "b": null, "c": 2.5},
                "doubles": {"a": 3.5, "b": null, "c": 4.5},
                "strings": {"a": "foo", "b": null, "c": "bar"},
                "blobs": {"a": "Zm9v", "b": null, "c": "YmFy"},
                "timestamps": {"a": 1609459200, "b": null, "c": 1609545600},
                "enums": {"a": "Foo", "b": null, "c": "Bar"},
                "intEnums": {"a": 1, "b": null, "c": 2}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: { a: true, b: null, c: false },
            bytes: { a: 5, b: null, c: 6 },
            shorts: { a: 256, b: null, c: 257 },
            integers: { a: 1, b: null, c: 2 },
            longs: { a: 999999999999, b: null, c: 999999999998 },
            floats: { a: 1.5, b: null, c: 2.5 },
            doubles: { a: 3.5, b: null, c: 4.5 },
            strings: { a: "foo", b: null, c: "bar" },
            blobs: { a: "foo", b: null, c: "bar" },
            timestamps: { a: 1609459200, b: null, c: 1609545600 },
            enums: { a: "Foo", b: null, c: "Bar" },
            intEnums: { a: 1, b: null, c: 2 },
        }
    },
    {
        id: "AwsJson11SparseMapOfScalarsNullAtEndResponse",
        documentation: "Deserializes sparse maps with a null as the last entry",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "booleans": {"a": true, "b": false, "c": null},
                "bytes": {"a": 5, "b": 6, "c": null},
                "shorts": {"a": 256, "b": 257, "c": null},
                "integers": {"a": 1, "b": 2, "c": null},
                "longs": {"a": 999999999999, "b": 999999999998, "c": null},
                "floats": {"a": 1.5, "b": 2.5, "c": null},
                "doubles": {"a": 3.5, "b": 4.5, "c": null},
                "strings": {"a": "foo", "b": "bar", "c": null},
                "blobs": {"a": "Zm9v", "b": "YmFy", "c": null},
                "timestamps": {"a": 1609459200, "b": 1609545600, "c": null},
                "enums": {"a": "Foo", "b": "Bar", "c": null},
                "intEnums": {"a": 1, "b": 2, "c": null}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            booleans: { a: true, b: false, c: null },
            bytes: { a: 5, b: 6, c: null },
            shorts: { a: 256, b: 257, c: null },
            integers: { a: 1, b: 2, c: null },
            longs: { a: 999999999999, b: 999999999998, c: null },
            floats: { a: 1.5, b: 2.5, c: null },
            doubles: { a: 3.5, b: 4.5, c: null },
            strings: { a: "foo", b: "bar", c: null },
            blobs: { a: "foo", b: "bar", c: null },
            timestamps: { a: 1609459200, b: 1609545600, c: null },
            enums: { a: "Foo", b: "Bar", c: null },
            intEnums: { a: 1, b: 2, c: null },
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

// =============================================================================
// UnionOfScalars
// =============================================================================

apply UnionOfScalars @httpRequestTests([
    {
        id: "AwsJson11UnionOfScalarsStringSerialize",
        documentation: "Serializes union string variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "stringValue": "hello"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                stringValue: "hello",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsBooleanSerialize",
        documentation: "Serializes union boolean variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "booleanValue": true
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                booleanValue: true,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsByteSerialize",
        documentation: "Serializes union byte variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "byteValue": 9
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                byteValue: 9,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsShortSerialize",
        documentation: "Serializes union short variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "shortValue": 512
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                shortValue: 512,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsIntegerSerialize",
        documentation: "Serializes union integer variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "integerValue": 42
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                integerValue: 42,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsLongSerialize",
        documentation: "Serializes union long variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "longValue": 999999999999
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                longValue: 999999999999,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsFloatSerialize",
        documentation: "Serializes union float variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "floatValue": 1.5
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                floatValue: 1.5,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsDoubleSerialize",
        documentation: "Serializes union double variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "doubleValue": 2.5
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                doubleValue: 2.5,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsBlobSerialize",
        documentation: "Serializes union blob variant (base64 on wire)",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "blobValue": "Zm9v"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                blobValue: "foo",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsMediaTypeSerialize",
        documentation: "Serializes union @mediaType string variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "mediaTypeValue": "{\\\"nested\\\":true}"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                mediaTypeValue: "{\"nested\":true}",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsTimestampSerialize",
        documentation: "Serializes union timestamp variant (epoch seconds on wire)",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "timestampValue": 1609459200
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                timestampValue: 1609459200,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsEnumSerialize",
        documentation: "Serializes union enum variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "enumValue": "Foo"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                enumValue: "Foo",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsIntEnumSerialize",
        documentation: "Serializes union intEnum variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "intEnumValue": 1
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                intEnumValue: 1,
            },
        },
    },
])

apply UnionOfScalars @httpResponseTests([
    {
        id: "AwsJson11UnionOfScalarsStringDeserialize",
        documentation: "Deserializes union string variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "stringValue": "hello"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                stringValue: "hello",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsBooleanDeserialize",
        documentation: "Deserializes union boolean variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "booleanValue": true
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                booleanValue: true,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsByteDeserialize",
        documentation: "Deserializes union byte variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "byteValue": 9
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                byteValue: 9,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsShortDeserialize",
        documentation: "Deserializes union short variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "shortValue": 512
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                shortValue: 512,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsIntegerDeserialize",
        documentation: "Deserializes union integer variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "integerValue": 42
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                integerValue: 42,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsLongDeserialize",
        documentation: "Deserializes union long variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "longValue": 999999999999
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                longValue: 999999999999,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsFloatDeserialize",
        documentation: "Deserializes union float variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "floatValue": 1.5
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                floatValue: 1.5,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsDoubleDeserialize",
        documentation: "Deserializes union double variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "doubleValue": 2.5
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                doubleValue: 2.5,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsBlobDeserialize",
        documentation: "Deserializes union blob variant (base64 on wire)",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "blobValue": "Zm9v"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                blobValue: "foo",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsMediaTypeDeserialize",
        documentation: "Deserializes union @mediaType string variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "mediaTypeValue": "{\\\"nested\\\":true}"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                mediaTypeValue: "{\"nested\":true}",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsTimestampDeserialize",
        documentation: "Deserializes union timestamp variant (epoch seconds on wire)",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "timestampValue": 1609459200
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                timestampValue: 1609459200,
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsEnumDeserialize",
        documentation: "Deserializes union enum variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "enumValue": "Foo"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                enumValue: "Foo",
            },
        },
    },
    {
        id: "AwsJson11UnionOfScalarsIntEnumDeserialize",
        documentation: "Deserializes union intEnum variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "intEnumValue": 1
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                intEnumValue: 1,
            },
        },
    },
])

// =============================================================================
// UnionOfStruct
// =============================================================================

apply UnionOfStruct @httpRequestTests([
    {
        id: "AwsJson11UnionOfStructSerialize",
        documentation: "Serializes union struct variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "structValue": {
                        "stringMember": "hello",
                        "integerMember": 42,
                        "booleanMember": true,
                        "mediaTypeMember": "{\\\"n\\\":1}"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfStruct",
        },
        params: {
            value: {
                structValue: {
                    stringMember: "hello",
                    integerMember: 42,
                    booleanMember: true,
                    mediaTypeMember: "{\"n\":1}",
                },
            },
        },
    },
])

apply UnionOfStruct @httpResponseTests([
    {
        id: "AwsJson11UnionOfStructDeserialize",
        documentation: "Deserializes union struct variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "structValue": {
                        "stringMember": "hello",
                        "integerMember": 42,
                        "booleanMember": true,
                        "mediaTypeMember": "{\\\"n\\\":1}"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                structValue: {
                    stringMember: "hello",
                    integerMember: 42,
                    booleanMember: true,
                    mediaTypeMember: "{\"n\":1}",
                },
            },
        },
    },
])

// =============================================================================
// UnionOfList
// =============================================================================

apply UnionOfList @httpRequestTests([
    {
        id: "AwsJson11UnionOfListSerialize",
        documentation: "Serializes union list variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "listValue": ["a", "b", "c"]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfList",
        },
        params: {
            value: {
                listValue: ["a", "b", "c"],
            },
        },
    },
])

apply UnionOfList @httpResponseTests([
    {
        id: "AwsJson11UnionOfListDeserialize",
        documentation: "Deserializes union list variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "listValue": ["a", "b", "c"]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                listValue: ["a", "b", "c"],
            },
        },
    },
])

// =============================================================================
// UnionOfMap
// =============================================================================

apply UnionOfMap @httpRequestTests([
    {
        id: "AwsJson11UnionOfMapSerialize",
        documentation: "Serializes union map variant",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "mapValue": {
                        "k1": "v1",
                        "k2": "v2"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfMap",
        },
        params: {
            value: {
                mapValue: {
                    k1: "v1",
                    k2: "v2",
                },
            },
        },
    },
])

apply UnionOfMap @httpResponseTests([
    {
        id: "AwsJson11UnionOfMapDeserialize",
        documentation: "Deserializes union map variant",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "mapValue": {
                        "k1": "v1",
                        "k2": "v2"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                mapValue: {
                    k1: "v1",
                    k2: "v2",
                },
            },
        },
    },
])

// =============================================================================
// UnionOfUnion
// =============================================================================

apply UnionOfUnion @httpRequestTests([
    {
        id: "AwsJson11UnionOfUnionSerialize",
        documentation: "Serializes union containing another union",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "unionValue": {
                        "stringValue": "nested"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.UnionOfUnion",
        },
        params: {
            value: {
                unionValue: {
                    stringValue: "nested",
                },
            },
        },
    },
])

apply UnionOfUnion @httpResponseTests([
    {
        id: "AwsJson11UnionOfUnionDeserialize",
        documentation: "Deserializes union containing another union",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "unionValue": {
                        "stringValue": "nested"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                unionValue: {
                    stringValue: "nested",
                },
            },
        },
    },
])

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
        documentation: "Serializes lists of maps for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfMaps",
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
        id: "AwsJson11ListOfMapsDeserialize",
        documentation: "Deserializes lists of maps for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11ListOfListsSerialize",
        documentation: "Serializes lists of lists for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ListOfLists",
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
        id: "AwsJson11ListOfListsDeserialize",
        documentation: "Deserializes lists of lists for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        documentation: "Serializes maps of maps for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfMaps",
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
        id: "AwsJson11MapOfMapsDeserialize",
        documentation: "Deserializes maps of maps for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11MapOfListsSerialize",
        documentation: "Serializes maps of lists for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.MapOfLists",
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
        id: "AwsJson11MapOfListsDeserialize",
        documentation: "Deserializes maps of lists for all scalar leaf types",
        protocol: awsJson1_1,
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
            "Content-Type": "application/x-amz-json-1.1",
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
        id: "AwsJson11SparseListOfStructsNullAtStart",
        documentation: "Serializes a sparse list with a null as the first element",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": [
                    null,
                    {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
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
                null,
                { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            ]
        }
    },
    {
        id: "AwsJson11SparseListOfStructsNullInMiddle",
        documentation: "Serializes a sparse list with a null as the middle element",
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
    {
        id: "AwsJson11SparseListOfStructsNullAtEnd",
        documentation: "Serializes a sparse list with a null as the last element",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": [
                    {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"},
                    null
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
                { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
                null,
            ]
        }
    },
])

apply SparseListOfStructs @httpResponseTests([
    {
        id: "AwsJson11SparseListOfStructsNullAtStartResponse",
        documentation: "Deserializes a sparse list with a null as the first element",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "values": [
                    null,
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
                null,
                { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            ]
        }
    },
    {
        id: "AwsJson11SparseListOfStructsNullInMiddleResponse",
        documentation: "Deserializes a sparse list with a null as the middle element",
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
    {
        id: "AwsJson11SparseListOfStructsNullAtEndResponse",
        documentation: "Deserializes a sparse list with a null as the last element",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "values": [
                    {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"},
                    null
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
                null,
            ]
        }
    },
])

// =============================================================================
// SparseMapOfStructs
// =============================================================================

apply SparseMapOfStructs @httpRequestTests([
    {
        id: "AwsJson11SparseMapOfStructsNullAtStart",
        documentation: "Serializes a sparse map with a null as the first entry",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": {
                    "a": null,
                    "b": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
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
                a: null,
                b: { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                c: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            }
        }
    },
    {
        id: "AwsJson11SparseMapOfStructsNullInMiddle",
        documentation: "Serializes a sparse map with a null as the middle entry",
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
    {
        id: "AwsJson11SparseMapOfStructsNullAtEnd",
        documentation: "Serializes a sparse map with a null as the last entry",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "values": {
                    "a": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    "b": {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"},
                    "c": null
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
                b: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
                c: null,
            }
        }
    },
])

apply SparseMapOfStructs @httpResponseTests([
    {
        id: "AwsJson11SparseMapOfStructsNullAtStartResponse",
        documentation: "Deserializes a sparse map with a null as the first entry",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "values": {
                    "a": null,
                    "b": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    "c": {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"}
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            values: {
                a: null,
                b: { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                c: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
            }
        }
    },
    {
        id: "AwsJson11SparseMapOfStructsNullInMiddleResponse",
        documentation: "Deserializes a sparse map with a null as the middle entry",
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
    {
        id: "AwsJson11SparseMapOfStructsNullAtEndResponse",
        documentation: "Deserializes a sparse map with a null as the last entry",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "values": {
                    "a": {"stringMember": "foo", "integerMember": 1, "booleanMember": true, "mediaTypeMember": "{\\\"n\\\":1}"},
                    "b": {"stringMember": "bar", "integerMember": 2, "booleanMember": false, "mediaTypeMember": "{\\\"n\\\":2}"},
                    "c": null
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            values: {
                a: { stringMember: "foo", integerMember: 1, booleanMember: true, mediaTypeMember: "{\"n\":1}" },
                b: { stringMember: "bar", integerMember: 2, booleanMember: false, mediaTypeMember: "{\"n\":2}" },
                c: null,
            }
        }
    },
])

// =============================================================================
// RecursiveStruct
// =============================================================================

apply RecursiveStruct @httpRequestTests([
    {
        id: "AwsJson11RecursiveStructTwoLevelsDeep",
        documentation: "Serializes recursive struct two levels deep via recursiveMember",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "stringMember": "level1",
                    "recursiveMember": {
                        "stringMember": "level2"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.RecursiveStruct",
        },
        params: {
            value: {
                stringMember: "level1",
                recursiveMember: {
                    stringMember: "level2",
                },
            },
        }
    },
    {
        id: "AwsJson11RecursiveStructViaList",
        documentation: "Serializes recursive struct via list",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "recursiveList": [
                        {
                            "stringMember": "inList1"
                        },
                        {
                            "stringMember": "inList2"
                        }
                    ]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.RecursiveStruct",
        },
        params: {
            value: {
                recursiveList: [
                    {
                        stringMember: "inList1",
                    },
                    {
                        stringMember: "inList2",
                    },
                ],
            },
        }
    },
    {
        id: "AwsJson11RecursiveStructViaMap",
        documentation: "Serializes recursive struct via map",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "recursiveMap": {
                        "key1": {
                            "stringMember": "inMap1"
                        },
                        "key2": {
                            "stringMember": "inMap2"
                        }
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.RecursiveStruct",
        },
        params: {
            value: {
                recursiveMap: {
                    key1: {
                        stringMember: "inMap1",
                    },
                    key2: {
                        stringMember: "inMap2",
                    },
                },
            },
        }
    },
])

apply RecursiveStruct @httpResponseTests([
    {
        id: "AwsJson11RecursiveStructTwoLevelsDeepDeserialize",
        documentation: "Deserializes recursive struct two levels deep via recursiveMember",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "stringMember": "level1",
                    "recursiveMember": {
                        "stringMember": "level2"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                stringMember: "level1",
                recursiveMember: {
                    stringMember: "level2",
                },
            },
        }
    },
    {
        id: "AwsJson11RecursiveStructViaListDeserialize",
        documentation: "Deserializes recursive struct via list",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "recursiveList": [
                        {
                            "stringMember": "inList1"
                        },
                        {
                            "stringMember": "inList2"
                        }
                    ]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                recursiveList: [
                    {
                        stringMember: "inList1",
                    },
                    {
                        stringMember: "inList2",
                    },
                ],
            },
        }
    },
    {
        id: "AwsJson11RecursiveStructViaMapDeserialize",
        documentation: "Deserializes recursive struct via map",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "recursiveMap": {
                        "key1": {
                            "stringMember": "inMap1"
                        },
                        "key2": {
                            "stringMember": "inMap2"
                        }
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                recursiveMap: {
                    key1: {
                        stringMember: "inMap1",
                    },
                    key2: {
                        stringMember: "inMap2",
                    },
                },
            },
        }
    },
])

// =============================================================================
// RecursiveUnion
// =============================================================================

apply RecursiveUnion @httpRequestTests([
    {
        id: "AwsJson11RecursiveUnionDirectRecursion",
        documentation: "Serializes recursive union two levels deep",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "recursiveValue": {
                        "stringValue": "nested"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.RecursiveUnion",
        },
        params: {
            value: {
                recursiveValue: {
                    stringValue: "nested",
                },
            },
        }
    },
    {
        id: "AwsJson11RecursiveUnionThroughStruct",
        documentation: "Serializes recursive union through struct",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "structValue": {
                        "value": {
                            "stringValue": "deep"
                        }
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.RecursiveUnion",
        },
        params: {
            value: {
                structValue: {
                    value: {
                        stringValue: "deep",
                    },
                },
            },
        }
    },
])

apply RecursiveUnion @httpResponseTests([
    {
        id: "AwsJson11RecursiveUnionDirectRecursionDeserialize",
        documentation: "Deserializes recursive union two levels deep",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "recursiveValue": {
                        "stringValue": "nested"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                recursiveValue: {
                    stringValue: "nested",
                },
            },
        }
    },
    {
        id: "AwsJson11RecursiveUnionThroughStructDeserialize",
        documentation: "Deserializes recursive union through struct",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "value": {
                    "structValue": {
                        "value": {
                            "stringValue": "deep"
                        }
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            value: {
                structValue: {
                    value: {
                        stringValue: "deep",
                    },
                },
            },
        }
    },
])

// =============================================================================
// EmptyInputOutput
// =============================================================================

apply EmptyInputOutput @httpRequestTests([
    {
        id: "AwsJson11EmptyInputOutputSerialize",
        documentation: "Serializes empty input as empty JSON object",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.EmptyInputOutput",
        },
        params: {}
    },
])

apply EmptyInputOutput @httpResponseTests([
    {
        id: "AwsJson11EmptyInputOutputDeserialize",
        documentation: "Deserializes empty JSON object body",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {}
    },
    {
        id: "AwsJson11EmptyInputOutputDeserializeEmptyBody",
        tags: ["absent-response-body"],
        documentation: "Deserializes empty string body as valid empty output",
        protocol: awsJson1_1,
        code: 200,
        body: "",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        appliesTo: "client",
        params: {}
    },
])

// =============================================================================
// NoInputOutput
// =============================================================================

apply NoInputOutput @httpRequestTests([
    {
        id: "AwsJson11NoInputOutputSerialize",
        documentation: "Serializes operation with no input as empty JSON object",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.NoInputOutput",
        },
        params: {}
    },
])

// =============================================================================
// ErrorOperation
// =============================================================================

apply SimpleError @httpResponseTests([
    {
        id: "AwsJson11SimpleErrorDeserialize",
        documentation: "Deserializes simple client error with __type discrimination",
        protocol: awsJson1_1,
        code: 400,
        body: """
            {
                "__type": "aws.protocoltests.corpus#SimpleError",
                "message": "oops"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            message: "oops",
        }
    },
])

apply ComplexError @httpResponseTests([
    {
        id: "AwsJson11ComplexErrorDeserialize",
        documentation: "Deserializes complex server error with nested struct",
        protocol: awsJson1_1,
        code: 500,
        body: """
            {
                "__type": "aws.protocoltests.corpus#ComplexError",
                "message": "something went wrong",
                "code": 42,
                "nested": {
                    "stringMember": "nestedValue",
                    "integerMember": 99
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            message: "something went wrong",
            code: 42,
            nested: {
                stringMember: "nestedValue",
                integerMember: 99,
            },
        }
    },
])
