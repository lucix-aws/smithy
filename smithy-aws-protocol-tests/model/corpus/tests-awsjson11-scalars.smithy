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
