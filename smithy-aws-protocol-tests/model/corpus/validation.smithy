$version: "2.0"

namespace aws.protocoltests.corpus

use smithy.framework#ValidationException

/// Server-side constraint trait validation: @range, @length, @pattern,
/// @uniqueItems, @enum, and presence (@required). This is architecturally
/// separate from every other layer in the corpus because it uses
/// smithy.test#httpMalformedRequestTests rather than httpRequestTests /
/// httpResponseTests: cases specify a literal raw HTTP request and a literal
/// expected HTTP response (status code + body assertion), not typed params
/// serialized through the operation's shapes. There is no appliesTo field on
/// this trait at all -- every case here is implicitly server-only, because
/// constraint traits are enforced when a server deserializes a request and
/// are not enforced by clients (see the Smithy spec's "Constraint trait
/// enforcement" section: enforced after deserializing input, not enforced
/// when serializing or deserializing output).
///
/// Not mixed into CoreProtocolTestService or any other layer -- kept
/// standalone and wired directly into RestJson1CorpusTests only, matching
/// upstream's real-world precedent (server validation coverage exists only
/// under restJson1 today).
///
/// Each operation below declares its own @http trait inline (rather than via
/// the mixin-then-apply-in-services.smithy pattern used elsewhere in the
/// corpus) because each httpMalformedRequestTests case's request.uri must
/// exactly match the operation's bound URI, so keeping them co-located in one
/// file is simpler to keep in sync.
@mixin
service ValidationProtocolTestService {
    operations: [
        MalformedRange
        MalformedLength
        MalformedPattern
        MalformedUniqueItems
        MalformedEnum
        MalformedRequired
    ]
}

// =============================================================================
// @range — byte, short, integer, long, float, double
// =============================================================================

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedRange", method: "POST")
operation MalformedRange {
    input: MalformedRangeInput
    errors: [ValidationException]
}

structure MalformedRangeInput {
    rangeByte: RangeByte

    rangeShort: RangeShort

    rangeInteger: RangeInteger

    rangeLong: RangeLong

    rangeFloat: RangeFloat

    rangeDouble: RangeDouble
}

@range(min: 2, max: 8)
byte RangeByte

@range(min: 2, max: 8)
short RangeShort

@range(min: 2, max: 8)
integer RangeInteger

@range(min: 2, max: 8)
long RangeLong

@range(min: 2.0, max: 8.0)
float RangeFloat

@range(min: 2.0, max: 8.0)
double RangeDouble

// =============================================================================
// @length — string, blob, list, map
// =============================================================================

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedLength", method: "POST")
operation MalformedLength {
    input: MalformedLengthInput
    errors: [ValidationException]
}

structure MalformedLengthInput {
    lengthString: LengthString

    lengthBlob: LengthBlob

    lengthList: LengthList

    lengthMap: LengthMap
}

@length(min: 2, max: 8)
string LengthString

@length(min: 2, max: 8)
blob LengthBlob

@length(min: 2, max: 4)
list LengthList {
    member: String
}

@length(min: 2, max: 4)
map LengthMap {
    key: String
    value: String
}

// =============================================================================
// @pattern — string
// =============================================================================

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedPattern", method: "POST")
operation MalformedPattern {
    input: MalformedPatternInput
    errors: [ValidationException]
}

structure MalformedPatternInput {
    patternString: PatternString
}

@pattern("^[a-m]+$")
string PatternString

// =============================================================================
// @uniqueItems — list
// =============================================================================

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedUniqueItems", method: "POST")
operation MalformedUniqueItems {
    input: MalformedUniqueItemsInput
    errors: [ValidationException]
}

structure MalformedUniqueItemsInput {
    uniqueItemsList: UniqueItemsList
}

@uniqueItems
list UniqueItemsList {
    member: String
}

// =============================================================================
// @enum — unknown value on deserialize
// =============================================================================

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedEnum", method: "POST")
operation MalformedEnum {
    input: MalformedEnumInput
    errors: [ValidationException]
}

structure MalformedEnumInput {
    enumValue: ValidationEnum
}

enum ValidationEnum {
    FOO = "Foo"
    BAR = "Bar"
    BAZ = "Baz"
}

// =============================================================================
// @required — presence
// =============================================================================

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedRequired", method: "POST")
operation MalformedRequired {
    input: MalformedRequiredInput
    errors: [ValidationException]
}

structure MalformedRequiredInput {
    @required
    requiredString: String

    @required
    requiredInteger: Integer
}

