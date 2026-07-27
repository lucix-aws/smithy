$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_1
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

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
                            "stringMember": "inList"
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
                        stringMember: "inList",
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
                            "stringMember": "inMap"
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
                        stringMember: "inMap",
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
                            "stringMember": "inList"
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
                        stringMember: "inList",
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
                            "stringMember": "inMap"
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
                        stringMember: "inMap",
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

apply ErrorOperation @httpResponseTests([
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
        },
        error: {
            shapeId: "aws.protocoltests.corpus#SimpleError",
        }
    },
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
        },
        error: {
            shapeId: "aws.protocoltests.corpus#ComplexError",
        }
    },
])
