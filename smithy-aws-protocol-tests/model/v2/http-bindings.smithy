$version: "2.0"

namespace aws.protocoltests.corpus

/// HTTP binding operations. These exercise the @http* traits that determine
/// where members are serialized in REST protocols (headers, query string,
/// URI labels, payload). Only applies to restJson1, restXml, etc.
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

// =============================================================================
// URI labels
// =============================================================================
@http(method: "GET", uri: "/HttpLabelScalars/{string}/{integer}/{boolean}/{timestamp}/{enumValue}")
operation HttpLabelScalars {
    input := {
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
        @timestampFormat("date-time")
        timestamp: Timestamp

        @required
        @httpLabel
        enumValue: CorpusStringEnum
    }

    output := {}
}

@http(method: "GET", uri: "/HttpLabelGreedy/{prefix}/{greedy+}")
operation HttpLabelGreedy {
    input := {
        @required
        @httpLabel
        prefix: String

        @required
        @httpLabel
        greedy: String
    }

    output := {}
}

// =============================================================================
// Query string
// =============================================================================
@http(method: "GET", uri: "/HttpQueryScalars")
operation HttpQueryScalars {
    input := {
        @httpQuery("str")
        string: String

        @httpQuery("int")
        integer: Integer

        @httpQuery("bool")
        boolean: Boolean

        @httpQuery("ts")
        @timestampFormat("date-time")
        timestamp: Timestamp

        @httpQuery("enum")
        enumValue: CorpusStringEnum

        @httpQuery("intEnum")
        intEnumValue: CorpusIntEnum
    }

    output := {}
}

@http(method: "GET", uri: "/HttpQueryList")
operation HttpQueryList {
    input := {
        @httpQuery("strings")
        strings: StringList

        @httpQuery("integers")
        integers: IntegerList

        @httpQuery("timestamps")
        timestamps: DateTimeTimestampList

        @httpQuery("enums")
        enums: CorpusStringEnumList
    }

    output := {}
}

@http(method: "GET", uri: "/HttpQueryMap")
operation HttpQueryMap {
    input := {
        @httpQueryParams
        params: StringMap
    }

    output := {}
}

// =============================================================================
// Headers
// =============================================================================
@http(method: "GET", uri: "/HttpHeaderScalars")
operation HttpHeaderScalars {
    input := {
        @httpHeader("X-String")
        string: String

        @httpHeader("X-Integer")
        integer: Integer

        @httpHeader("X-Boolean")
        boolean: Boolean

        @httpHeader("X-Timestamp")
        @timestampFormat("http-date")
        timestamp: Timestamp

        @httpHeader("X-Enum")
        enumValue: CorpusStringEnum

        @httpHeader("X-IntEnum")
        intEnumValue: CorpusIntEnum
    }

    output := {
        @httpHeader("X-String")
        string: String

        @httpHeader("X-Integer")
        integer: Integer

        @httpHeader("X-Boolean")
        boolean: Boolean

        @httpHeader("X-Timestamp")
        @timestampFormat("http-date")
        timestamp: Timestamp

        @httpHeader("X-Enum")
        enumValue: CorpusStringEnum

        @httpHeader("X-IntEnum")
        intEnumValue: CorpusIntEnum
    }
}

@http(method: "GET", uri: "/HttpHeaderList")
operation HttpHeaderList {
    input := {
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

    output := {
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
}

@http(method: "GET", uri: "/HttpHeaderTimestamps")
operation HttpHeaderTimestamps {
    input := {
        @httpHeader("X-DateTime")
        @timestampFormat("date-time")
        dateTime: Timestamp

        @httpHeader("X-EpochSeconds")
        @timestampFormat("epoch-seconds")
        epochSeconds: Timestamp

        @httpHeader("X-HttpDate")
        @timestampFormat("http-date")
        httpDate: Timestamp
    }

    output := {
        @httpHeader("X-DateTime")
        @timestampFormat("date-time")
        dateTime: Timestamp

        @httpHeader("X-EpochSeconds")
        @timestampFormat("epoch-seconds")
        epochSeconds: Timestamp

        @httpHeader("X-HttpDate")
        @timestampFormat("http-date")
        httpDate: Timestamp
    }
}

@http(method: "GET", uri: "/HttpPrefixHeaders")
operation HttpPrefixHeaders {
    input := {
        @httpPrefixHeaders("X-Prefix-")
        prefixHeaders: StringMap
    }

    output := {
        @httpPrefixHeaders("X-Prefix-")
        prefixHeaders: StringMap
    }
}

// =============================================================================
// Implicit payload — members without HTTP binding traits become the body
// =============================================================================
@http(method: "POST", uri: "/HttpImplicitPayload")
operation HttpImplicitPayload {
    input := {
        @httpHeader("X-Token")
        token: String

        @httpQuery("query")
        queryParam: String

        // These are the implicit payload (serialized as JSON/XML body):
        name: String

        age: Integer

        nested: SimpleStruct
    }

    output := {
        @httpHeader("X-Token")
        token: String

        // These are the implicit payload:
        name: String

        age: Integer

        nested: SimpleStruct
    }
}

// =============================================================================
// Explicit payload
// =============================================================================
@http(method: "POST", uri: "/HttpPayloadStruct")
operation HttpPayloadStruct {
    input := {
        @httpPayload
        payload: SimpleStruct
    }

    output := {
        @httpPayload
        payload: SimpleStruct
    }
}

@http(method: "POST", uri: "/HttpPayloadBlob")
operation HttpPayloadBlob {
    input := {
        @httpHeader("Content-Type")
        contentType: String

        @httpPayload
        payload: Blob
    }

    output := {
        @httpHeader("Content-Type")
        contentType: String

        @httpPayload
        payload: Blob
    }
}

@http(method: "POST", uri: "/HttpPayloadString")
operation HttpPayloadString {
    input := {
        @httpPayload
        payload: String
    }

    output := {
        @httpPayload
        payload: String
    }
}

@http(method: "POST", uri: "/HttpPayloadStreamingBlob")
operation HttpPayloadStreamingBlob {
    input := {
        @httpHeader("Content-Type")
        contentType: String

        @httpPayload
        payload: StreamingBlob = ""
    }

    output := {
        @httpHeader("Content-Type")
        contentType: String

        @httpPayload
        payload: StreamingBlob = ""
    }
}

@streaming
blob StreamingBlob

// =============================================================================
// Response code
// =============================================================================
@http(method: "POST", uri: "/HttpResponseCode")
operation HttpResponseCode {
    input := {}

    output := {
        @httpResponseCode
        statusCode: Integer
    }
}
