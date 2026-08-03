$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// RecursiveStruct
// =============================================================================

apply RecursiveStruct @httpRequestTests([
    {
        id: "AwsJson10RecursiveStructTwoLevelsDeep",
        documentation: "Serializes recursive struct two levels deep via recursiveMember",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.RecursiveStruct",
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
        id: "AwsJson10RecursiveStructViaList",
        documentation: "Serializes recursive struct via list",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.RecursiveStruct",
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
        id: "AwsJson10RecursiveStructViaMap",
        documentation: "Serializes recursive struct via map",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.RecursiveStruct",
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
        id: "AwsJson10RecursiveStructTwoLevelsDeepDeserialize",
        documentation: "Deserializes recursive struct two levels deep via recursiveMember",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10RecursiveStructViaListDeserialize",
        documentation: "Deserializes recursive struct via list",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10RecursiveStructViaMapDeserialize",
        documentation: "Deserializes recursive struct via map",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10RecursiveUnionDirectRecursion",
        documentation: "Serializes recursive union two levels deep",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.RecursiveUnion",
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
        id: "AwsJson10RecursiveUnionThroughStruct",
        documentation: "Serializes recursive union through struct",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.RecursiveUnion",
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
        id: "AwsJson10RecursiveUnionDirectRecursionDeserialize",
        documentation: "Deserializes recursive union two levels deep",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10RecursiveUnionThroughStructDeserialize",
        documentation: "Deserializes recursive union through struct",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10EmptyInputOutputSerialize",
        documentation: "Serializes empty input as empty JSON object",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.EmptyInputOutput",
        },
        params: {}
    },
])

apply EmptyInputOutput @httpResponseTests([
    {
        id: "AwsJson10EmptyInputOutputDeserialize",
        documentation: "Deserializes empty JSON object body",
        protocol: awsJson1_0,
        code: 200,
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {}
    },
    {
        id: "AwsJson10EmptyInputOutputDeserializeEmptyBody",
        tags: ["absent-response-body"],
        documentation: "Deserializes empty string body as valid empty output",
        protocol: awsJson1_0,
        code: 200,
        body: "",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
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
        id: "AwsJson10NoInputOutputSerialize",
        documentation: "Serializes operation with no input as empty JSON object",
        protocol: awsJson1_0,
        method: "POST",
        uri: "/",
        body: """
            {}""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
            "X-Amz-Target": "AwsJson10CorpusTests.NoInputOutput",
        },
        params: {}
    },
])

// =============================================================================
// ErrorOperation
// =============================================================================

apply SimpleError @httpResponseTests([
    {
        id: "AwsJson10SimpleErrorDeserialize",
        documentation: "Deserializes simple client error with __type discrimination",
        protocol: awsJson1_0,
        code: 400,
        body: """
            {
                "__type": "aws.protocoltests.corpus#SimpleError",
                "message": "oops"
            }""",
        bodyMediaType: "application/json",
        headers: {
            "Content-Type": "application/x-amz-json-1.0",
        },
        params: {
            message: "oops",
        }
    },
])

apply ComplexError @httpResponseTests([
    {
        id: "AwsJson10ComplexErrorDeserialize",
        documentation: "Deserializes complex server error with nested struct",
        protocol: awsJson1_0,
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
            "Content-Type": "application/x-amz-json-1.0",
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
