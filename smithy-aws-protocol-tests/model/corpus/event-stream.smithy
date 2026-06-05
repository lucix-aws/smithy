$version: "2.0"

namespace aws.protocoltests.corpus

/// Event stream operations. Tests the binary message framing, event
/// dispatch, @eventHeader/@eventPayload traits, error events, and
/// initial messages. Applies to all protocols except query.
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

// =============================================================================
// Response stream — struct payload events
// =============================================================================

operation EventStreamResponse {
    input := {}
    output := {
        @jsonName("jsonEvents") @xmlName("xmlEvents")
        @httpPayload @required events: ResponseEventStream
    }
}

@streaming
union ResponseEventStream {
    messageEvent: MessageEvent
    heartbeatEvent: HeartbeatEvent
}

structure MessageEvent {
    @jsonName("jsonContent") @xmlName("xmlContent")
    content: String
    @jsonName("jsonSequence") @xmlName("xmlSequence")
    sequence: Integer
}

structure HeartbeatEvent {}

// =============================================================================
// Response stream — blob @eventPayload
// =============================================================================

operation EventStreamResponseBlobPayload {
    input := {}
    output := {
        @jsonName("jsonEvents") @xmlName("xmlEvents")
        @httpPayload @required events: BlobPayloadEventStream
    }
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

// =============================================================================
// Response stream — @eventHeader members
// =============================================================================

operation EventStreamResponseHeaders {
    input := {}
    output := {
        @jsonName("jsonEvents") @xmlName("xmlEvents")
        @httpPayload @required events: HeaderEventStream
    }
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
    timestampHeader: Timestamp
    @eventHeader
    blobHeader: Blob
    @eventPayload
    body: String
}

// =============================================================================
// Response stream — @eventHeader + implicit payload (no @eventPayload)
// =============================================================================

operation EventStreamResponseImplicitPayload {
    input := {}
    output := {
        @httpPayload @required events: ImplicitPayloadEventStream
    }
}

@streaming
union ImplicitPayloadEventStream {
    dataEvent: ImplicitPayloadEvent
}

structure ImplicitPayloadEvent {
    @eventHeader
    requestId: String
    // These become the protocol-specific document body (implicit payload):
    content: String
    count: Integer
    nested: SimpleStruct
}

// =============================================================================
// Error event in stream
// =============================================================================

operation EventStreamError {
    input := {}
    output := {
        @jsonName("jsonEvents") @xmlName("xmlEvents")
        @httpPayload @required events: ErrorEventStream
    }
}

@streaming
union ErrorEventStream {
    messageEvent: MessageEvent
    streamError: StreamError
}

@error("server")
structure StreamError {
    @jsonName("jsonMessage") @xmlName("xmlMessage")
    message: String
    @jsonName("jsonCode") @xmlName("xmlCode")
    code: Integer
}

// =============================================================================
// Request stream (client -> server)
// =============================================================================

operation EventStreamRequest {
    input := {
        @jsonName("jsonEvents") @xmlName("xmlEvents")
        @httpPayload @required events: RequestEventStream
    }
    output := {}
}

@streaming
union RequestEventStream {
    sendMessage: SendMessageEvent
    endStream: EndStreamEvent
}

structure SendMessageEvent {
    @jsonName("jsonContent") @xmlName("xmlContent")
    content: String
}

structure EndStreamEvent {}

// =============================================================================
// Initial response — non-stream members sent before events
// =============================================================================

operation EventStreamInitialResponse {
    input := {}
    output := {
        @httpHeader("X-Session-Id")
        @jsonName("jsonSessionId") @xmlName("xmlSessionId")
        sessionId: String
        @httpHeader("X-Timeout")
        @jsonName("jsonTimeout") @xmlName("xmlTimeout")
        timeout: Integer
        @httpPayload @required events: ResponseEventStream
    }
}
