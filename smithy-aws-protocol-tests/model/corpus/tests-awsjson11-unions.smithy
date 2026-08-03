$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_1
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

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
