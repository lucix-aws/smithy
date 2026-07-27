$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_1
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// DefaultScalars
// =============================================================================

apply DefaultScalars @httpRequestTests([
    {
        id: "AwsJson11DefaultScalarsOmitsDefaults",
        documentation: "Client does not serialize members set to their default value",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.DefaultScalars",
        },
        appliesTo: "client",
        params: {
            defaultBoolean: false,
            defaultByte: 0,
            defaultShort: 0,
            defaultInteger: 0,
            defaultLong: 0,
            defaultFloat: 0,
            defaultDouble: 0,
            defaultString: "",
            defaultBlob: "",
            defaultEnum: "Foo",
            defaultIntEnum: 1,
            zeroBoolean: false,
            zeroByte: 0,
            zeroShort: 0,
            zeroInteger: 0,
            zeroLong: 0,
            zeroFloat: 0,
            zeroDouble: 0,
            emptyString: "",
            emptyBlob: "",
        }
    },
    {
        id: "AwsJson11DefaultScalarsSerializeNonDefaults",
        documentation: "Serializes members when explicitly set to non-default values",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "defaultBoolean": true,
                "defaultByte": 5,
                "defaultShort": 10,
                "defaultInteger": 42,
                "defaultLong": 100,
                "defaultFloat": 1.5,
                "defaultDouble": 2.5,
                "defaultString": "custom",
                "defaultBlob": "aGVsbG8=",
                "defaultEnum": "Bar",
                "defaultIntEnum": 2,
                "zeroBoolean": true,
                "zeroByte": 1,
                "zeroShort": 1,
                "zeroInteger": 1,
                "zeroLong": 1,
                "zeroFloat": 1.0,
                "zeroDouble": 1.0,
                "emptyString": "not empty",
                "emptyBlob": "YWJj"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.DefaultScalars",
        },
        params: {
            defaultBoolean: true,
            defaultByte: 5,
            defaultShort: 10,
            defaultInteger: 42,
            defaultLong: 100,
            defaultFloat: 1.5,
            defaultDouble: 2.5,
            defaultString: "custom",
            defaultBlob: "hello",
            defaultEnum: "Bar",
            defaultIntEnum: 2,
            zeroBoolean: true,
            zeroByte: 1,
            zeroShort: 1,
            zeroInteger: 1,
            zeroLong: 1,
            zeroFloat: 1.0,
            zeroDouble: 1.0,
            emptyString: "not empty",
            emptyBlob: "abc",
        }
    },
])

apply DefaultScalars @httpResponseTests([
    {
        id: "AwsJson11DefaultScalarsPopulatesDefaultsOnDeserialize",
        documentation: "Client fills default values when members are absent in response",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        appliesTo: "client",
        params: {
            defaultBoolean: false,
            defaultByte: 0,
            defaultShort: 0,
            defaultInteger: 0,
            defaultLong: 0,
            defaultFloat: 0,
            defaultDouble: 0,
            defaultString: "",
            defaultBlob: "",
            defaultEnum: "Foo",
            defaultIntEnum: 1,
            zeroBoolean: false,
            zeroByte: 0,
            zeroShort: 0,
            zeroInteger: 0,
            zeroLong: 0,
            zeroFloat: 0,
            zeroDouble: 0,
            emptyString: "",
            emptyBlob: "",
        }
    },
])

// =============================================================================
// DefaultCollections
// =============================================================================

apply DefaultCollections @httpRequestTests([
    {
        id: "AwsJson11DefaultCollectionsOmitsEmptyDefaults",
        documentation: "Client does not serialize empty list/map at default value",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.DefaultCollections",
        },
        appliesTo: "client",
        params: {
            defaultList: [],
            defaultMap: {},
        }
    },
    {
        id: "AwsJson11DefaultCollectionsSerializeNonEmpty",
        documentation: "Serializes non-empty list and map",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "defaultList": ["a", "b"],
                "defaultMap": {"key1": "value1"}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.DefaultCollections",
        },
        params: {
            defaultList: ["a", "b"],
            defaultMap: { key1: "value1" },
        }
    },
])

// =============================================================================
// NestedDefaults
// =============================================================================

apply NestedDefaults @httpRequestTests([
    {
        id: "AwsJson11NestedDefaultsSerialize",
        documentation: "Serializes nested structs with defaults populated",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "topLevel": {
                    "nested": {
                        "greeting": "hello",
                        "count": 0,
                        "inner": {
                            "farewell": "goodbye"
                        }
                    },
                    "nestedList": [
                        {
                            "greeting": "hi",
                            "count": 5
                        }
                    ],
                    "nestedMap": {
                        "entry1": {
                            "greeting": "hey",
                            "count": 10
                        }
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.NestedDefaults",
        },
        params: {
            topLevel: {
                nested: {
                    greeting: "hello",
                    count: 0,
                    inner: {
                        farewell: "goodbye",
                    },
                },
                nestedList: [
                    {
                        greeting: "hi",
                        count: 5,
                    },
                ],
                nestedMap: {
                    entry1: {
                        greeting: "hey",
                        count: 10,
                    },
                },
            },
        }
    },
])

apply NestedDefaults @httpResponseTests([
    {
        id: "AwsJson11NestedDefaultsDeserializePopulatesDefaults",
        documentation: "Client fills defaults for absent nested fields",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "topLevel": {
                    "nested": {},
                    "nestedList": [{}],
                    "nestedMap": {
                        "entry1": {}
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        appliesTo: "client",
        params: {
            topLevel: {
                nested: {
                    greeting: "hello",
                    count: 0,
                },
                nestedList: [
                    {
                        greeting: "hello",
                        count: 0,
                    },
                ],
                nestedMap: {
                    entry1: {
                        greeting: "hello",
                        count: 0,
                    },
                },
            },
        }
    },
])

// =============================================================================
// RequiredMembers
// =============================================================================

apply RequiredMembers @httpRequestTests([
    {
        id: "AwsJson11RequiredMembersSerialize",
        documentation: "Serializes all required fields",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "requiredString": "hello",
                "requiredInteger": 42,
                "requiredBoolean": true,
                "requiredList": ["a"],
                "requiredMap": {"key": "value"},
                "requiredStringWithDefault": "custom",
                "requiredIntegerWithDefault": 5,
                "requiredBooleanWithDefault": true,
                "requiredListWithDefault": ["b"],
                "requiredMapWithDefault": {"k": "v"}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.RequiredMembers",
        },
        params: {
            requiredString: "hello",
            requiredInteger: 42,
            requiredBoolean: true,
            requiredList: ["a"],
            requiredMap: { key: "value" },
            requiredStringWithDefault: "custom",
            requiredIntegerWithDefault: 5,
            requiredBooleanWithDefault: true,
            requiredListWithDefault: ["b"],
            requiredMapWithDefault: { k: "v" },
        }
    },
])

apply RequiredMembers @httpResponseTests([
    {
        id: "AwsJson11RequiredMembersDeserializeZeroValues",
        documentation: "Client fills zero-values for required fields without defaults when server omits them",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        appliesTo: "client",
        params: {
            requiredString: "",
            requiredInteger: 0,
            requiredBoolean: false,
            requiredList: [],
            requiredMap: {},
            requiredStringWithDefault: "default",
            requiredIntegerWithDefault: 0,
            requiredBooleanWithDefault: false,
            requiredListWithDefault: [],
            requiredMapWithDefault: {},
        }
    },
    {
        id: "AwsJson11RequiredMembersDeserializeDefaults",
        documentation: "Client fills defaults for required fields with @default when server omits them",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "requiredString": "provided",
                "requiredInteger": 1,
                "requiredBoolean": true,
                "requiredList": ["x"],
                "requiredMap": {"a": "b"}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        appliesTo: "client",
        params: {
            requiredString: "provided",
            requiredInteger: 1,
            requiredBoolean: true,
            requiredList: ["x"],
            requiredMap: { a: "b" },
            requiredStringWithDefault: "default",
            requiredIntegerWithDefault: 0,
            requiredBooleanWithDefault: false,
            requiredListWithDefault: [],
            requiredMapWithDefault: {},
        }
    },
])

// =============================================================================
// NullSparseMembers
// =============================================================================

apply NullSparseMembers @httpRequestTests([
    {
        id: "AwsJson11NullSparseMembersSerialize",
        documentation: "Null values in sparse collections are serialized as JSON null",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {
                "sparseStringList": [null, "hello", null],
                "sparseStringMap": {"key1": null, "key2": "value"},
                "sparseStructList": [null, {"stringMember": "a"}],
                "sparseStructMap": {"key1": null, "key2": {"stringMember": "b"}}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.NullSparseMembers",
        },
        params: {
            sparseStringList: [null, "hello", null],
            sparseStringMap: { key1: null, key2: "value" },
            sparseStructList: [null, { stringMember: "a" }],
            sparseStructMap: { key1: null, key2: { stringMember: "b" } },
        }
    },
])

apply NullSparseMembers @httpResponseTests([
    {
        id: "AwsJson11NullSparseMembersDeserialize",
        documentation: "Null values in sparse collections are preserved on deserialization",
        protocol: awsJson1_1,
        code: 200,
        body: """
            {
                "sparseStringList": ["a", null],
                "sparseStringMap": {"k": null},
                "sparseStructList": [null],
                "sparseStructMap": {"k": null}
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
        },
        params: {
            sparseStringList: ["a", null],
            sparseStringMap: { k: null },
            sparseStructList: [null],
            sparseStructMap: { k: null },
        }
    },
])

// =============================================================================
// ClientOptionalDefaults
// =============================================================================

apply ClientOptionalDefaults @httpRequestTests([
    {
        id: "AwsJson11ClientOptionalDefaultsNotPopulated",
        documentation: "Client does not populate defaults for @clientOptional members",
        protocol: awsJson1_1,
        method: "POST",
        uri: "/",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.1",
            "X-Amz-Target": "AwsJson11CorpusTests.ClientOptionalDefaults",
        },
        appliesTo: "client",
        params: {}
    },
])
