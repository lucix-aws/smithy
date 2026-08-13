$version: "2.0"

namespace aws.protocoltests.corpus

// The control group for the corpus bet that every member carries a wire-name
// trait. Nothing here has @jsonName, @xmlName, @ec2QueryName, or
// @timestampFormat, so every member must use its plain member name on the wire
// and every timestamp must use the protocol's default format. A protocol that
// only ever read the override trait passes Core and fails here.
//
// Deliberately a representative subset, not the full transition matrix. Extend
// only if a transition would resolve wire names differently, not for breadth.
@mixin
service NoProtocolTraitsBehaviorService with [CoreProtocolTestService] {
    operations: [
        NoTraitScalarMembers
        NoTraitStructOfScalars
        NoTraitListOfScalars
        NoTraitMapOfScalars
        NoTraitUnionMembers
    ]
}

operation NoTraitScalarMembers {
    input: NoTraitScalarStruct
    output: NoTraitScalarStruct
}

structure NoTraitScalarStruct {
    booleanMember: Boolean
    byteMember: Byte
    shortMember: Short
    integerMember: Integer
    longMember: Long
    floatMember: Float
    doubleMember: Double
    bigIntegerMember: BigInteger
    bigDecimalMember: BigDecimal
    stringMember: String
    blobMember: Blob
    timestampMember: NoFormatTimestamp
    enumMember: CorpusStringEnum
    intEnumMember: CorpusIntEnum
}

operation NoTraitStructOfScalars {
    input: NoTraitStructOfScalarsInput
    output: NoTraitStructOfScalarsOutput
}

structure NoTraitStructOfScalarsInput {
    nested: NoTraitSimpleStruct
}

structure NoTraitStructOfScalarsOutput {
    nested: NoTraitSimpleStruct
}

structure NoTraitSimpleStruct {
    stringMember: String
    integerMember: Integer
    booleanMember: Boolean
    timestampMember: NoFormatTimestamp
}

operation NoTraitListOfScalars {
    input: NoTraitListOfScalarsInput
    output: NoTraitListOfScalarsOutput
}

structure NoTraitListOfScalarsInput {
    strings: StringList
    integers: IntegerList
    timestamps: TimestampList
}

structure NoTraitListOfScalarsOutput {
    strings: StringList
    integers: IntegerList
    timestamps: TimestampList
}

operation NoTraitMapOfScalars {
    input: NoTraitMapOfScalarsInput
    output: NoTraitMapOfScalarsOutput
}

structure NoTraitMapOfScalarsInput {
    strings: StringMap
    integers: IntegerMap
    timestamps: TimestampMap
}

structure NoTraitMapOfScalarsOutput {
    strings: StringMap
    integers: IntegerMap
    timestamps: TimestampMap
}

operation NoTraitUnionMembers {
    input: NoTraitUnionMembersInput
    output: NoTraitUnionMembersOutput
}

structure NoTraitUnionMembersInput {
    value: NoTraitUnion
}

structure NoTraitUnionMembersOutput {
    value: NoTraitUnion
}

union NoTraitUnion {
    stringMember: String
    integerMember: Integer
    booleanMember: Boolean
    listMember: StringList
    mapMember: StringMap
    structMember: NoTraitSimpleStruct
}
