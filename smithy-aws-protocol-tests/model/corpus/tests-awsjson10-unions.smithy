$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// UnionOfScalars
// =============================================================================

apply UnionOfScalars @httpRequestTests([
    {
        id: "AwsJson10UnionOfScalarsStringSerialize",
        documentation: "Serializes union string variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                stringValue: "hello",
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsBooleanSerialize",
        documentation: "Serializes union boolean variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                booleanValue: true,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsIntegerSerialize",
        documentation: "Serializes union integer variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                integerValue: 42,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsLongSerialize",
        documentation: "Serializes union long variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                longValue: 999999999999,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsFloatSerialize",
        documentation: "Serializes union float variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                floatValue: 1.5,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsDoubleSerialize",
        documentation: "Serializes union double variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                doubleValue: 2.5,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsBlobSerialize",
        documentation: "Serializes union blob variant (base64 on wire)",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                blobValue: "foo",
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsTimestampSerialize",
        documentation: "Serializes union timestamp variant (epoch seconds on wire)",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                timestampValue: 1609459200,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsEnumSerialize",
        documentation: "Serializes union enum variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
        },
        params: {
            value: {
                enumValue: "Foo",
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsIntEnumSerialize",
        documentation: "Serializes union intEnum variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfScalars",
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
        id: "AwsJson10UnionOfScalarsStringDeserialize",
        documentation: "Deserializes union string variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "stringValue": "hello"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                stringValue: "hello",
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsBooleanDeserialize",
        documentation: "Deserializes union boolean variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "booleanValue": true
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                booleanValue: true,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsIntegerDeserialize",
        documentation: "Deserializes union integer variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "integerValue": 42
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                integerValue: 42,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsLongDeserialize",
        documentation: "Deserializes union long variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "longValue": 999999999999
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                longValue: 999999999999,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsFloatDeserialize",
        documentation: "Deserializes union float variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "floatValue": 1.5
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                floatValue: 1.5,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsDoubleDeserialize",
        documentation: "Deserializes union double variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "doubleValue": 2.5
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                doubleValue: 2.5,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsBlobDeserialize",
        documentation: "Deserializes union blob variant (base64 on wire)",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "blobValue": "Zm9v"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                blobValue: "foo",
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsTimestampDeserialize",
        documentation: "Deserializes union timestamp variant (epoch seconds on wire)",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "timestampValue": 1609459200
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                timestampValue: 1609459200,
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsEnumDeserialize",
        documentation: "Deserializes union enum variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "enumValue": "Foo"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                enumValue: "Foo",
            },
        },
    },
    {
        id: "AwsJson10UnionOfScalarsIntEnumDeserialize",
        documentation: "Deserializes union intEnum variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "intEnumValue": 1
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10UnionOfStructSerialize",
        documentation: "Serializes union struct variant",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {
                "value": {
                    "structValue": {
                        "stringMember": "hello",
                        "integerMember": 42,
                        "booleanMember": true
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfStruct",
        },
        params: {
            value: {
                structValue: {
                    stringMember: "hello",
                    integerMember: 42,
                    booleanMember: true,
                },
            },
        },
    },
])

apply UnionOfStruct @httpResponseTests([
    {
        id: "AwsJson10UnionOfStructDeserialize",
        documentation: "Deserializes union struct variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "structValue": {
                        "stringMember": "hello",
                        "integerMember": 42,
                        "booleanMember": true
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            value: {
                structValue: {
                    stringMember: "hello",
                    integerMember: 42,
                    booleanMember: true,
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
        id: "AwsJson10UnionOfListSerialize",
        documentation: "Serializes union list variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfList",
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
        id: "AwsJson10UnionOfListDeserialize",
        documentation: "Deserializes union list variant",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {
                "value": {
                    "listValue": ["a", "b", "c"]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10UnionOfMapSerialize",
        documentation: "Serializes union map variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfMap",
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
        id: "AwsJson10UnionOfMapDeserialize",
        documentation: "Deserializes union map variant",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10UnionOfUnionSerialize",
        documentation: "Serializes union containing another union",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.UnionOfUnion",
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
        id: "AwsJson10UnionOfUnionDeserialize",
        documentation: "Deserializes union containing another union",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
