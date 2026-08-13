$version: "2.0"

namespace aws.protocoltests.corpus

use smithy.framework#ValidationException

// Constraint trait enforcement, which is a server concern: the server rejects a
// non-compliant request after deserializing it. Note this is the opposite
// direction from the @required coverage in Defaults, which is a client repairing
// a non-compliant response.
//
// One operation per constraint trait, each with a member per constrained type.
// Cases use @httpMalformedRequestTests, so they're literal HTTP requests and
// responses with no typed params, and they're implicitly server-only since that
// trait has no appliesTo field. restJson1 only today.
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

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedRange", method: "POST")
operation MalformedRange {
    input: MalformedRangeInput
    errors: [
        ValidationException
    ]
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

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedLength", method: "POST")
operation MalformedLength {
    input: MalformedLengthInput
    errors: [
        ValidationException
    ]
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

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedPattern", method: "POST")
operation MalformedPattern {
    input: MalformedPatternInput
    errors: [
        ValidationException
    ]
}

structure MalformedPatternInput {
    patternString: PatternString
}

@pattern("^[a-m]+$")
string PatternString

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedUniqueItems", method: "POST")
operation MalformedUniqueItems {
    input: MalformedUniqueItemsInput
    errors: [
        ValidationException
    ]
}

structure MalformedUniqueItemsInput {
    uniqueItemsList: UniqueItemsList
}

@uniqueItems
list UniqueItemsList {
    member: String
}

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedEnum", method: "POST")
operation MalformedEnum {
    input: MalformedEnumInput
    errors: [
        ValidationException
    ]
}

structure MalformedEnumInput {
    enumValue: ValidationEnum
}

enum ValidationEnum {
    FOO = "Foo"
    BAR = "Bar"
    BAZ = "Baz"
}

@suppress(["UnstableTrait"])
@http(uri: "/corpus/MalformedRequired", method: "POST")
operation MalformedRequired {
    input: MalformedRequiredInput
    errors: [
        ValidationException
    ]
}

structure MalformedRequiredInput {
    @required
    requiredString: String

    @required
    requiredInteger: Integer
}
