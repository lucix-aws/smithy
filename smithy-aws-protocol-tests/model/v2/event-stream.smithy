$version: "2.0"

namespace aws.protocoltests.corpus

// Binary event stream framing: message dispatch, @eventHeader and @eventPayload,
// implicit payloads, error events, request streams, and the initial response.
// Mixed into every protocol except awsQuery and ec2Query.
//
// The payload inside an event is ordinary serde, so ResponseEventStream mirrors
// the Core transitions with one event per class (scalars, list, map, struct,
// union) plus an empty event that carries no payload at all. document stays out
// for the same reason it's out of Core. Extend by adding a framing behavior, or
// by widening an event's payload to match a Core transition it's missing.
//
// Cases use @eventStreamTests rather than the http test traits, since framing
// can't be expressed as a single request or response.
@mixin
service EventStreamProtocolTestService with [CoreProtocolTestService] {
    operations: [
        EventStreamResponse
        EventStreamResponseBlobPayload
        EventStreamResponseHeaders
        EventStreamResponseImplicitPayload
        EventStreamError
        EventStreamRequest
        EventStreamInitialResponse
    ]
}

operation EventStreamResponse {
    input: EventStreamResponseInput
    output: EventStreamResponseOutput
}

structure EventStreamResponseInput {}

structure EventStreamResponseOutput {
    @jsonName("jsonEvents")
    @xmlName("xmlEvents")
    @httpPayload
    @required
    events: ResponseEventStream
}

@streaming
union ResponseEventStream {
    scalarsEvent: ScalarsEvent
    listEvent: ListEvent
    mapEvent: MapEvent
    structEvent: StructEvent
    unionEvent: UnionEvent
    heartbeatEvent: HeartbeatEvent
}

structure ScalarsEvent {
    @jsonName("jsonBooleanMember")
    @xmlName("xmlBooleanMember")
    booleanMember: Boolean

    @jsonName("jsonByteMember")
    @xmlName("xmlByteMember")
    byteMember: Byte

    @jsonName("jsonShortMember")
    @xmlName("xmlShortMember")
    shortMember: Short

    @jsonName("jsonIntegerMember")
    @xmlName("xmlIntegerMember")
    integerMember: Integer

    @jsonName("jsonLongMember")
    @xmlName("xmlLongMember")
    longMember: Long

    @jsonName("jsonFloatMember")
    @xmlName("xmlFloatMember")
    floatMember: Float

    @jsonName("jsonDoubleMember")
    @xmlName("xmlDoubleMember")
    doubleMember: Double

    @jsonName("jsonBigIntegerMember")
    @xmlName("xmlBigIntegerMember")
    bigIntegerMember: BigInteger

    @jsonName("jsonBigDecimalMember")
    @xmlName("xmlBigDecimalMember")
    bigDecimalMember: BigDecimal

    @jsonName("jsonStringMember")
    @xmlName("xmlStringMember")
    stringMember: String

    @jsonName("jsonBlobMember")
    @xmlName("xmlBlobMember")
    blobMember: Blob

    @jsonName("jsonTimestampMember")
    @xmlName("xmlTimestampMember")
    timestampMember: NoFormatTimestamp

    @jsonName("jsonStringEnum")
    @xmlName("xmlStringEnum")
    stringEnum: CorpusStringEnum

    @jsonName("jsonIntEnum")
    @xmlName("xmlIntEnum")
    intEnum: CorpusIntEnum
}

structure ListEvent {
    @jsonName("jsonStrings")
    @xmlName("xmlStrings")
    strings: StringList

    @jsonName("jsonIntegers")
    @xmlName("xmlIntegers")
    integers: IntegerList

    @jsonName("jsonTimestamps")
    @xmlName("xmlTimestamps")
    timestamps: TimestampList
}

structure MapEvent {
    @jsonName("jsonStrings")
    @xmlName("xmlStrings")
    strings: StringMap

    @jsonName("jsonIntegers")
    @xmlName("xmlIntegers")
    integers: IntegerMap

    @jsonName("jsonTimestamps")
    @xmlName("xmlTimestamps")
    timestamps: TimestampMap
}

structure StructEvent {
    @jsonName("jsonValue")
    @xmlName("xmlValue")
    value: SimpleStruct
}

structure UnionEvent {
    @jsonName("jsonValue")
    @xmlName("xmlValue")
    value: CorpusUnion
}

structure MessageEvent {
    @jsonName("jsonContent")
    @xmlName("xmlContent")
    content: String

    @jsonName("jsonSequence")
    @xmlName("xmlSequence")
    sequence: Integer
}

structure HeartbeatEvent {}

operation EventStreamResponseBlobPayload {
    input: EventStreamResponseBlobPayloadInput
    output: EventStreamResponseBlobPayloadOutput
}

structure EventStreamResponseBlobPayloadInput {}

structure EventStreamResponseBlobPayloadOutput {
    @jsonName("jsonEvents")
    @xmlName("xmlEvents")
    @httpPayload
    @required
    events: BlobPayloadEventStream
}

@streaming
union BlobPayloadEventStream {
    blobEvent: BlobPayloadEvent
}

structure BlobPayloadEvent {
    @eventHeader
    contentType: String

    @eventPayload
    data: Blob
}

operation EventStreamResponseHeaders {
    input: EventStreamResponseHeadersInput
    output: EventStreamResponseHeadersOutput
}

structure EventStreamResponseHeadersInput {}

structure EventStreamResponseHeadersOutput {
    @jsonName("jsonEvents")
    @xmlName("xmlEvents")
    @httpPayload
    @required
    events: HeaderEventStream
}

@streaming
union HeaderEventStream {
    headerEvent: HeaderEvent
}

structure HeaderEvent {
    @eventHeader
    stringHeader: String

    @eventHeader
    integerHeader: Integer

    @eventHeader
    booleanHeader: Boolean

    @eventHeader
    longHeader: Long

    @eventHeader
    timestampHeader: NoFormatTimestamp

    @eventHeader
    blobHeader: Blob

    @eventPayload
    body: String
}

operation EventStreamResponseImplicitPayload {
    input: EventStreamResponseImplicitPayloadInput
    output: EventStreamResponseImplicitPayloadOutput
}

structure EventStreamResponseImplicitPayloadInput {}

structure EventStreamResponseImplicitPayloadOutput {
    @httpPayload
    @required
    events: ImplicitPayloadEventStream
}

@streaming
union ImplicitPayloadEventStream {
    dataEvent: ImplicitPayloadEvent
}

structure ImplicitPayloadEvent {
    @eventHeader
    requestId: String

    content: String

    count: Integer

    nested: SimpleStruct
}

operation EventStreamError {
    input: EventStreamErrorInput
    output: EventStreamErrorOutput
}

structure EventStreamErrorInput {}

structure EventStreamErrorOutput {
    @jsonName("jsonEvents")
    @xmlName("xmlEvents")
    @httpPayload
    @required
    events: ErrorEventStream
}

@streaming
union ErrorEventStream {
    messageEvent: MessageEvent
    streamError: StreamError
}

@error("server")
structure StreamError {
    @jsonName("jsonMessage")
    @xmlName("xmlMessage")
    message: String

    @jsonName("jsonCode")
    @xmlName("xmlCode")
    code: Integer
}

operation EventStreamRequest {
    input: EventStreamRequestInput
    output: EventStreamRequestOutput
}

structure EventStreamRequestInput {
    @jsonName("jsonEvents")
    @xmlName("xmlEvents")
    @httpPayload
    @required
    events: RequestEventStream
}

structure EventStreamRequestOutput {}

@streaming
union RequestEventStream {
    sendMessage: SendMessageEvent
    endStream: EndStreamEvent
}

structure SendMessageEvent {
    @jsonName("jsonContent")
    @xmlName("xmlContent")
    content: String
}

structure EndStreamEvent {}

operation EventStreamInitialResponse {
    input: EventStreamInitialResponseInput
    output: EventStreamInitialResponseOutput
}

structure EventStreamInitialResponseInput {}

structure EventStreamInitialResponseOutput {
    @httpHeader("X-Session-Id")
    @jsonName("jsonSessionId")
    @xmlName("xmlSessionId")
    sessionId: String

    @httpHeader("X-Timeout")
    @jsonName("jsonTimeout")
    @xmlName("xmlTimeout")
    timeout: Integer

    @httpPayload
    @required
    events: ResponseEventStream
}
