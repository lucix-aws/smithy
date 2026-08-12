$version: "2.0"

namespace aws.protocoltests.corpus

use smithy.protocols#rpcv2Json
use smithy.test#InitialHttpResponse
use smithy.test#eventStreamTests

// =============================================================================
// EventStreamProtocolTestService
//
// These cases use smithy.test#eventStreamTests rather than
// httpRequestTests/httpResponseTests: the subject is the vnd.amazon.eventstream
// binary framing layer, which the HTTP test traits cannot describe. The trait
// is applied to the OPERATION (its selector matches an operation whose input or
// output contains an event stream).
//
// `bytes` is deliberately omitted from every event. It is optional, and the
// spec is explicit that it "SHOULD NOT be used to make assertions about
// serialized events" because header ordering, optional whitespace and framing
// checksums make byte-for-byte comparison unreliable. Test runners construct
// the framed message from `headers` + `body` instead.
//
// Framing header conventions asserted here (established by the upstream
// restJson1 event stream suite):
//   :message-type   "event" for events, "exception" for modeled errors,
//                   "error" for unmodeled errors
//   :event-type     the streaming union's member name
//   :content-type   application/json for struct and implicit payloads,
//                   application/octet-stream for a blob @eventPayload,
//                   text/plain for a string @eventPayload. Events with no
//                   payload at all carry no :content-type.
// =============================================================================

// =============================================================================
// EventStreamResponse — struct payload events, and event dispatch across
// multiple variants in one stream
// =============================================================================

apply EventStreamResponse @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamResponseMessage"
        documentation: "Deserializes a single struct-payload event off a response stream"
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                params: {
                    messageEvent: { content: "first message", sequence: 11 }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "messageEvent" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"first message","sequence":11}"""
                bodyMediaType: "application/json"
            }
        ]
    }
    {
        id: "RpcV2JsonEventStreamResponseMultipleEvents"
        documentation: """
            Dispatches a sequence of events to the correct union variants. The
            heartbeat event models an empty structure, so it carries no payload
            and therefore no :content-type header."""
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                params: {
                    messageEvent: { content: "first message", sequence: 11 }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "messageEvent" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"first message","sequence":11}"""
                bodyMediaType: "application/json"
            }
            {
                type: "response"
                params: {
                    heartbeatEvent: {}
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "heartbeatEvent" }
                }
            }
            {
                type: "response"
                params: {
                    messageEvent: { content: "second message", sequence: 22 }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "messageEvent" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"second message","sequence":22}"""
                bodyMediaType: "application/json"
            }
        ]
    }
])

// =============================================================================
// EventStreamResponseBlobPayload — blob @eventPayload
// =============================================================================

apply EventStreamResponseBlobPayload @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamResponseBlobPayload"
        documentation: """
            A blob @eventPayload is written as the raw message payload, not
            base64-encoded, and takes the application/octet-stream content
            type. The modeled @eventHeader member is carried as a message
            header and does not appear in the payload."""
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                params: {
                    blobEvent: { contentType: "text/csv", data: "row1,row2" }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "blobEvent" }
                    ":content-type": { string: "application/octet-stream" }
                    "contentType": { string: "text/csv" }
                }
                body: "row1,row2"
                bodyMediaType: "application/octet-stream"
            }
        ]
    }
])

// =============================================================================
// EventStreamResponseHeaders — every @eventHeader scalar type, plus a string
// @eventPayload
// =============================================================================

apply EventStreamResponseHeaders @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamResponseHeaders"
        documentation: """
            Each @eventHeader member is carried as a typed event stream message
            header rather than in the payload, and a string @eventPayload takes
            the text/plain content type."""
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                params: {
                    headerEvent: {
                        stringHeader: "headerString"
                        integerHeader: 1234
                        booleanHeader: true
                        longHeader: 9000000000
                        timestampHeader: 1609502096
                        blobHeader: "header"
                        body: "event payload text"
                    }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "headerEvent" }
                    ":content-type": { string: "text/plain" }
                    "stringHeader": { string: "headerString" }
                    "integerHeader": { integer: 1234 }
                    "booleanHeader": { boolean: true }
                    "longHeader": { long: 9000000000 }
                    "timestampHeader": { timestamp: 1609502096 }
                    "blobHeader": { blob: "aGVhZGVy" }
                }
                body: "event payload text"
                bodyMediaType: "text/plain"
            }
        ]
    }
])

// =============================================================================
// EventStreamResponseImplicitPayload — @eventHeader alongside an implicit
// document payload
// =============================================================================

apply EventStreamResponseImplicitPayload @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamResponseImplicitPayload"
        documentation: """
            With no @eventPayload member, the remaining non-header members form
            an implicit document payload. The @eventHeader member is excluded
            from that payload and appears only as a message header."""
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                params: {
                    dataEvent: {
                        requestId: "request-91"
                        content: "implicit payload content"
                        count: 33
                        nested: {
                            stringMember: "nestedString"
                            integerMember: 44
                            booleanMember: true
                            mediaTypeMember: "{\"nested\":true}"
                        }
                    }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "dataEvent" }
                    ":content-type": { string: "application/json" }
                    "requestId": { string: "request-91" }
                }
                body: """
                    {"content":"implicit payload content","count":33,"nested":{"stringMember":"nestedString","integerMember":44,"booleanMember":true,"mediaTypeMember":"{\\\"nested\\\":true}"}}"""
                bodyMediaType: "application/json"
            }
        ]
    }
])

// =============================================================================
// EventStreamError — error events in a stream
//
// All three cases are appliesTo: "client". A modeled error arriving mid-stream
// terminates the stream and surfaces as an exception on the consuming side;
// that is a client-side deserialization behavior, and the corresponding server
// behavior (choosing to emit it) is not something a static case can assert.
// =============================================================================

apply EventStreamError @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamErrorModeled"
        documentation: """
            A modeled error event uses :message-type "exception" and names the
            union member in :exception-type, and resolves to the modeled error
            shape rather than a generic failure."""
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                params: {
                    streamError: { message: "stream failed", code: 57 }
                }
                headers: {
                    ":message-type": { string: "exception" }
                    ":exception-type": { string: "streamError" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"message":"stream failed","code":57}"""
                bodyMediaType: "application/json"
            }
        ]
        expectation: {
            failure: { errorId: StreamError }
        }
        appliesTo: "client"
    }
    {
        id: "RpcV2JsonEventStreamErrorAfterMessage"
        documentation: """
            An error event arriving after successfully delivered events still
            resolves to the modeled error shape, so the events preceding it
            must not mask it."""
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                params: {
                    messageEvent: { content: "delivered before failure", sequence: 66 }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "messageEvent" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"delivered before failure","sequence":66}"""
                bodyMediaType: "application/json"
            }
            {
                type: "response"
                params: {
                    streamError: { message: "stream failed", code: 57 }
                }
                headers: {
                    ":message-type": { string: "exception" }
                    ":exception-type": { string: "streamError" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"message":"stream failed","code":57}"""
                bodyMediaType: "application/json"
            }
        ]
        expectation: {
            failure: { errorId: StreamError }
        }
        appliesTo: "client"
    }
    {
        id: "RpcV2JsonEventStreamErrorUnmodeled"
        documentation: """
            Clients must handle a structured but unmodeled error, which uses
            :message-type "error" with the code and message carried entirely in
            headers and no payload."""
        protocol: rpcv2Json
        events: [
            {
                type: "response"
                headers: {
                    ":message-type": { string: "error" }
                    ":error-code": { string: "InternalFailure" }
                    ":error-message": { string: "an unknown error occurred" }
                }
            }
        ]
        expectation: {
            failure: {}
        }
        appliesTo: "client"
    }
])

// =============================================================================
// EventStreamRequest — client to server stream
// =============================================================================

apply EventStreamRequest @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamRequestSendMessage"
        documentation: "Serializes a single struct-payload event onto a request stream"
        protocol: rpcv2Json
        events: [
            {
                type: "request"
                params: {
                    sendMessage: { content: "outbound message" }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "sendMessage" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"outbound message"}"""
                bodyMediaType: "application/json"
            }
        ]
    }
    {
        id: "RpcV2JsonEventStreamRequestMultipleEvents"
        documentation: """
            Serializes a sequence of events onto a request stream, closing with
            an empty-structure event that carries no payload and therefore no
            :content-type header."""
        protocol: rpcv2Json
        events: [
            {
                type: "request"
                params: {
                    sendMessage: { content: "outbound message" }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "sendMessage" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"outbound message"}"""
                bodyMediaType: "application/json"
            }
            {
                type: "request"
                params: {
                    sendMessage: { content: "second outbound message" }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "sendMessage" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"second outbound message"}"""
                bodyMediaType: "application/json"
            }
            {
                type: "request"
                params: {
                    endStream: {}
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "endStream" }
                }
            }
        ]
    }
])

// =============================================================================
// EventStreamInitialResponse — non-stream output members alongside a stream
//
// NOTE, and this is the one genuinely unspecified decision in this file:
// streaming.rst says initial-response fields map to HTTP headers only "When
// using HTTP bindings", and that "In other protocols, the initial-response can
// be sent however is necessary for the protocol". rpcv2Json has no HTTP
// bindings — it ignores the operation's @httpHeader traits entirely — and
// neither the rpcv2Json nor the RPC v2 protocol specs define a representation.
//
// The representation asserted here is an in-stream event with
// :event-type "initial-response" whose payload is the serialized non-stream
// output members. That is what smithy-go implements for every non-REST
// protocol (internal/eventstream/codec.go: SerializeInitialRequest writes
// :event-type "initial-request", DeserializeInitialResponse requires
// :event-type "initial-response"), and it matches the convention used by
// deployed AWS event stream services. It is not, however, written down in a
// spec, so this case is asserting a de facto convention.
//
// SECOND NOTE: this case would also carry `initialResponseParams` naming the
// expected sessionId/timeout values, but it cannot. The eventStreamTests
// validator checks initialResponseParams against the operation's FULL output
// shape (EventStreamTestsTraitValidator: `model.expectShape(
// operation.getOutputShape()).accept(outputValidator)`), and this corpus marks
// the stream member `@required`, so validation demands an `events` value inside
// initialResponseParams. That contradicts streaming.rst, which defines the
// initial-response as "the output of an operation with no value provided for
// the event stream member" — the stream member should be excluded from that
// check. Upstream's restJson1 suite does not hit this only because its stream
// members are not `@required`. Until that validator is fixed, the wire form is
// asserted through the initial-response event's body instead.
// =============================================================================

apply EventStreamInitialResponse @eventStreamTests([
    {
        id: "RpcV2JsonEventStreamInitialResponse"
        documentation: """
            Non-stream output members are delivered ahead of the stream. Under
            rpcv2Json the operation's @httpHeader bindings are ignored, so they
            travel in the payload of an initial-response event rather than in
            HTTP response headers."""
        protocol: rpcv2Json
        initialResponse: {
            code: 200
            headers: {
                "smithy-protocol": "rpc-v2-json"
                "Content-Type": "application/vnd.amazon.eventstream"
            }
        }
        initialResponseShape: InitialHttpResponse
        events: [
            {
                type: "response"
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "initial-response" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"sessionId":"session4a2f","timeout":30}"""
                bodyMediaType: "application/json"
            }
            {
                type: "response"
                params: {
                    messageEvent: { content: "message after initial response", sequence: 77 }
                }
                headers: {
                    ":message-type": { string: "event" }
                    ":event-type": { string: "messageEvent" }
                    ":content-type": { string: "application/json" }
                }
                body: """
                    {"content":"message after initial response","sequence":77}"""
                bodyMediaType: "application/json"
            }
        ]
    }
])
