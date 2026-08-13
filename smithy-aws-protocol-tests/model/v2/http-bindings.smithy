$version: "2.0"

namespace aws.protocoltests.corpus

// REST HTTP binding traits: values bound to the URI, query string, headers, and
// payload rather than to a document body. Mixed into restJson1 and restXml only.
// It mixes in Core itself, so those two services pick up the whole transition
// matrix through this layer rather than listing Core separately.
//
// One operation per binding trait. Body serde belongs in Core, so don't grow
// these operations into general shape coverage.
@mixin
service HttpBindingProtocolTestService with [CoreProtocolTestService] {
    operations: [
        HttpLabelScalars
        HttpLabelGreedy
        HttpQueryScalars
        HttpQueryList
        HttpQueryMap
        HttpHeaderScalars
        HttpHeaderList
        HttpHeaderTimestamps
        HttpPrefixHeaders
        HttpPayloadStruct
        HttpPayloadBlob
        HttpPayloadString
        HttpPayloadStreamingBlob
        HttpImplicitPayload
        HttpResponseCode
    ]
}

@http(method: "GET", uri: "/HttpLabelScalars/{string}/{integer}/{boolean}/{timestamp}/{enumValue}")
operation HttpLabelScalars {
    input: HttpLabelScalarsInput
    output: HttpLabelScalarsOutput
}

structure HttpLabelScalarsInput {
    @required
    @httpLabel
    string: String

    @required
    @httpLabel
    integer: Integer

    @required
    @httpLabel
    boolean: Boolean

    @required
    @httpLabel
    timestamp: DateTimeTimestamp

    @required
    @httpLabel
    enumValue: CorpusStringEnum
}

structure HttpLabelScalarsOutput {}

@http(method: "GET", uri: "/HttpLabelGreedy/{prefix}/{greedy+}")
operation HttpLabelGreedy {
    input: HttpLabelGreedyInput
    output: HttpLabelGreedyOutput
}

structure HttpLabelGreedyInput {
    @required
    @httpLabel
    prefix: String

    @required
    @httpLabel
    greedy: String
}

structure HttpLabelGreedyOutput {}

@http(method: "GET", uri: "/HttpQueryScalars")
operation HttpQueryScalars {
    input: HttpQueryScalarsInput
    output: HttpQueryScalarsOutput
}

structure HttpQueryScalarsInput {
    @httpQuery("str")
    string: String

    @httpQuery("int")
    integer: Integer

    @httpQuery("bool")
    boolean: Boolean

    @httpQuery("ts")
    timestamp: DateTimeTimestamp

    @httpQuery("enum")
    enumValue: CorpusStringEnum

    @httpQuery("intEnum")
    intEnumValue: CorpusIntEnum
}

structure HttpQueryScalarsOutput {}

@http(method: "GET", uri: "/HttpQueryList")
operation HttpQueryList {
    input: HttpQueryListInput
    output: HttpQueryListOutput
}

structure HttpQueryListInput {
    @httpQuery("strings")
    strings: StringList

    @httpQuery("integers")
    integers: IntegerList

    @httpQuery("timestamps")
    timestamps: DateTimeTimestampList

    @httpQuery("enums")
    enums: CorpusStringEnumList
}

structure HttpQueryListOutput {}

@http(method: "GET", uri: "/HttpQueryMap")
operation HttpQueryMap {
    input: HttpQueryMapInput
    output: HttpQueryMapOutput
}

structure HttpQueryMapInput {
    @httpQueryParams
    params: StringMap
}

structure HttpQueryMapOutput {}

@http(method: "GET", uri: "/HttpHeaderScalars")
operation HttpHeaderScalars {
    input: HttpHeaderScalarsInput
    output: HttpHeaderScalarsOutput
}

structure HttpHeaderScalarsInput {
    @httpHeader("X-String")
    string: String

    @httpHeader("X-Integer")
    integer: Integer

    @httpHeader("X-Boolean")
    boolean: Boolean

    @httpHeader("X-Timestamp")
    timestamp: HttpDateTimestamp

    @httpHeader("X-Enum")
    enumValue: CorpusStringEnum

    @httpHeader("X-IntEnum")
    intEnumValue: CorpusIntEnum
}

structure HttpHeaderScalarsOutput {
    @httpHeader("X-String")
    string: String

    @httpHeader("X-Integer")
    integer: Integer

    @httpHeader("X-Boolean")
    boolean: Boolean

    @httpHeader("X-Timestamp")
    timestamp: HttpDateTimestamp

    @httpHeader("X-Enum")
    enumValue: CorpusStringEnum

    @httpHeader("X-IntEnum")
    intEnumValue: CorpusIntEnum
}

@http(method: "GET", uri: "/HttpHeaderList")
operation HttpHeaderList {
    input: HttpHeaderListInput
    output: HttpHeaderListOutput
}

structure HttpHeaderListInput {
    @httpHeader("X-Strings")
    strings: StringList

    @httpHeader("X-Integers")
    integers: IntegerList

    @httpHeader("X-Booleans")
    booleans: BooleanList

    @httpHeader("X-Timestamps")
    timestamps: HttpDateTimestampList

    @httpHeader("X-Enums")
    enums: CorpusStringEnumList
}

structure HttpHeaderListOutput {
    @httpHeader("X-Strings")
    strings: StringList

    @httpHeader("X-Integers")
    integers: IntegerList

    @httpHeader("X-Booleans")
    booleans: BooleanList

    @httpHeader("X-Timestamps")
    timestamps: HttpDateTimestampList

    @httpHeader("X-Enums")
    enums: CorpusStringEnumList
}

@http(method: "GET", uri: "/HttpHeaderTimestamps")
operation HttpHeaderTimestamps {
    input: HttpHeaderTimestampsInput
    output: HttpHeaderTimestampsOutput
}

structure HttpHeaderTimestampsInput {
    @httpHeader("X-DateTime")
    dateTime: DateTimeTimestamp

    @httpHeader("X-EpochSeconds")
    epochSeconds: EpochSecondsTimestamp

    @httpHeader("X-HttpDate")
    httpDate: HttpDateTimestamp
}

structure HttpHeaderTimestampsOutput {
    @httpHeader("X-DateTime")
    dateTime: DateTimeTimestamp

    @httpHeader("X-EpochSeconds")
    epochSeconds: EpochSecondsTimestamp

    @httpHeader("X-HttpDate")
    httpDate: HttpDateTimestamp
}

@http(method: "GET", uri: "/HttpPrefixHeaders")
operation HttpPrefixHeaders {
    input: HttpPrefixHeadersInput
    output: HttpPrefixHeadersOutput
}

structure HttpPrefixHeadersInput {
    @httpPrefixHeaders("X-Prefix-")
    prefixHeaders: StringMap
}

structure HttpPrefixHeadersOutput {
    @httpPrefixHeaders("X-Prefix-")
    prefixHeaders: StringMap
}

@http(method: "POST", uri: "/HttpImplicitPayload")
operation HttpImplicitPayload {
    input: HttpImplicitPayloadInput
    output: HttpImplicitPayloadOutput
}

structure HttpImplicitPayloadInput {
    @httpHeader("X-Token")
    token: String

    @httpQuery("query")
    queryParam: String

    name: String

    age: Integer

    nested: SimpleStruct
}

structure HttpImplicitPayloadOutput {
    @httpHeader("X-Token")
    token: String

    name: String

    age: Integer

    nested: SimpleStruct
}

@http(method: "POST", uri: "/HttpPayloadStruct")
operation HttpPayloadStruct {
    input: HttpPayloadStructInput
    output: HttpPayloadStructOutput
}

structure HttpPayloadStructInput {
    @httpPayload
    payload: SimpleStruct
}

structure HttpPayloadStructOutput {
    @httpPayload
    payload: SimpleStruct
}

@http(method: "POST", uri: "/HttpPayloadBlob")
operation HttpPayloadBlob {
    input: HttpPayloadBlobInput
    output: HttpPayloadBlobOutput
}

structure HttpPayloadBlobInput {
    @httpHeader("Content-Type")
    contentType: String

    @httpPayload
    payload: Blob
}

structure HttpPayloadBlobOutput {
    @httpHeader("Content-Type")
    contentType: String

    @httpPayload
    payload: Blob
}

@http(method: "POST", uri: "/HttpPayloadString")
operation HttpPayloadString {
    input: HttpPayloadStringInput
    output: HttpPayloadStringOutput
}

structure HttpPayloadStringInput {
    @httpPayload
    payload: String
}

structure HttpPayloadStringOutput {
    @httpPayload
    payload: String
}

@http(method: "POST", uri: "/HttpPayloadStreamingBlob")
operation HttpPayloadStreamingBlob {
    input: HttpPayloadStreamingBlobInput
    output: HttpPayloadStreamingBlobOutput
}

structure HttpPayloadStreamingBlobInput {
    @httpHeader("Content-Type")
    contentType: String

    @httpPayload
    payload: StreamingBlob = ""
}

structure HttpPayloadStreamingBlobOutput {
    @httpHeader("Content-Type")
    contentType: String

    @httpPayload
    payload: StreamingBlob = ""
}

@streaming
blob StreamingBlob

@http(method: "POST", uri: "/HttpResponseCode")
operation HttpResponseCode {
    input: HttpResponseCodeInput
    output: HttpResponseCodeOutput
}

structure HttpResponseCodeInput {}

structure HttpResponseCodeOutput {
    @httpResponseCode
    statusCode: Integer
}
