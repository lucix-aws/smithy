$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// ListOfScalars
// =============================================================================

apply ListOfScalars @httpRequestTests([
    {
        id: "AwsJson10ListOfScalarsPopulated",
        documentation: "Serializes all scalar list types",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfScalars",
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
        id: "AwsJson10ListOfScalarsEmpty",
        tags: ["empty"],
        documentation: "Serializes empty lists",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.ListOfScalars",
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
        id: "AwsJson10ListOfScalarsPopulatedResponse",
        documentation: "Deserializes all scalar list types",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10ListOfScalarsEmptyResponse",
        tags: ["empty"],
        documentation: "Deserializes empty lists",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10SparseListOfScalarsNullAtStart",
        documentation: "Serializes sparse lists with a null as the first element",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseListOfScalars",
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
        id: "AwsJson10SparseListOfScalarsNullInMiddle",
        documentation: "Serializes sparse lists with a null as the middle element",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseListOfScalars",
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
        id: "AwsJson10SparseListOfScalarsNullAtEnd",
        documentation: "Serializes sparse lists with a null as the last element",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseListOfScalars",
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
        id: "AwsJson10SparseListOfScalarsNullAtStartResponse",
        documentation: "Deserializes sparse lists with a null as the first element",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10SparseListOfScalarsNullInMiddleResponse",
        documentation: "Deserializes sparse lists with a null as the middle element",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10SparseListOfScalarsNullAtEndResponse",
        documentation: "Deserializes sparse lists with a null as the last element",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10MapOfScalarsPopulated",
        documentation: "Serializes all scalar map types",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfScalars",
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
        id: "AwsJson10MapOfScalarsEmpty",
        tags: ["empty"],
        documentation: "Serializes empty maps",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.MapOfScalars",
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
        id: "AwsJson10MapOfScalarsPopulatedResponse",
        documentation: "Deserializes all scalar map types",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10MapOfScalarsEmptyResponse",
        tags: ["empty"],
        documentation: "Deserializes empty maps",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10SparseMapOfScalarsNullAtStart",
        documentation: "Serializes sparse maps with a null as the first entry",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseMapOfScalars",
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
        id: "AwsJson10SparseMapOfScalarsNullInMiddle",
        documentation: "Serializes sparse maps with a null as the middle entry",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseMapOfScalars",
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
        id: "AwsJson10SparseMapOfScalarsNullAtEnd",
        documentation: "Serializes sparse maps with a null as the last entry",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.SparseMapOfScalars",
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
        id: "AwsJson10SparseMapOfScalarsNullAtStartResponse",
        documentation: "Deserializes sparse maps with a null as the first entry",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10SparseMapOfScalarsNullInMiddleResponse",
        documentation: "Deserializes sparse maps with a null as the middle entry",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10SparseMapOfScalarsNullAtEndResponse",
        documentation: "Deserializes sparse maps with a null as the last entry",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10StructOfScalarsPopulated",
        documentation: "Serializes a fully populated nested struct",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.StructOfScalars",
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
        id: "AwsJson10StructOfScalarsPopulatedResponse",
        documentation: "Deserializes a fully populated nested struct",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
