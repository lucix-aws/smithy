$version: "2.0"

namespace aws.protocoltests.corpus

/// NoProtocolTraitsBehavior — operations where naming/format traits are ABSENT.
/// Tests verify protocols fall back to default behavior:
/// - Wire names = member names (no @jsonName, @xmlName, @ec2QueryName)
/// - Timestamp format = protocol default (no @timestampFormat)
///
/// This does NOT need to re-test the full transition matrix. A representative
/// subset of operations covers the fallback logic.
///
/// For query protocols, the name resolution hierarchy is:
///   ec2Query: @ec2QueryName > @xmlName > member name
///   awsQuery: @xmlName > member name
/// The NoTraitScalarMembers operation covers the bottom (member name only).
/// Core operations cover the top (all traits present).
/// The middle level (xmlName without ec2QueryName) is NOT separately tested
/// here — that fallback is inherent in the spec and validated by test cases
/// on the Core operations where both are present.
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

// =============================================================================
// Scalar members with no naming/format traits — wire names = member names,
// timestamps use protocol default format
// =============================================================================
operation NoTraitScalarMembers {
    input: NoTraitScalarStruct
    output: NoTraitScalarStruct
}

/// All members use plain member names, no @jsonName/@xmlName/@ec2QueryName.
/// Timestamp members have no @timestampFormat — protocol uses its default.
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
    timestampMember: Timestamp
    enumMember: CorpusStringEnum
    intEnumMember: CorpusIntEnum
}

// =============================================================================
// Struct nesting with no traits
// =============================================================================
operation NoTraitStructOfScalars {
    input := {
        nested: NoTraitSimpleStruct
    }
    output := {
        nested: NoTraitSimpleStruct
    }
}

structure NoTraitSimpleStruct {
    stringMember: String
    integerMember: Integer
    booleanMember: Boolean
    timestampMember: Timestamp
}

// =============================================================================
// List with no traits
// =============================================================================
operation NoTraitListOfScalars {
    input := {
        strings: StringList
        integers: IntegerList
        timestamps: TimestampList
    }
    output := {
        strings: StringList
        integers: IntegerList
        timestamps: TimestampList
    }
}

// =============================================================================
// Map with no traits
// =============================================================================
operation NoTraitMapOfScalars {
    input := {
        strings: StringMap
        integers: IntegerMap
        timestamps: TimestampMap
    }
    output := {
        strings: StringMap
        integers: IntegerMap
        timestamps: TimestampMap
    }
}

// =============================================================================
// Union with no traits — verifies union member name resolution defaults
// =============================================================================
operation NoTraitUnionMembers {
    input := {
        value: NoTraitUnion
    }
    output := {
        value: NoTraitUnion
    }
}

union NoTraitUnion {
    stringMember: String
    integerMember: Integer
    booleanMember: Boolean
    listMember: StringList
    mapMember: StringMap
    structMember: NoTraitSimpleStruct
}
