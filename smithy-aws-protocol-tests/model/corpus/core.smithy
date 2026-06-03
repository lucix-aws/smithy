$version: "2.0"

namespace aws.protocoltests.corpus

/// Core body serde shapes. These operations exercise the structural nesting
/// combinations that a protocol serializer/deserializer must handle. The shapes
/// are protocol-agnostic — any protocol that serializes a document body must
/// pass tests against all of these.
@mixin
service CoreProtocolTestService {
    operations: [
        // Scalar baselines
        ScalarMembers

        // Collection of scalars (all scalar types within each container)
        ListOfScalars
        SparseListOfScalars
        MapOfScalars
        SparseMapOfScalars

        // Union transitions (each maps to one transition)
        UnionOfScalars
        UnionOfStruct
        UnionOfList
        UnionOfMap
        UnionOfUnion

        // Depth-1: struct containing all scalars (tests explicit struct read/write)
        StructOfScalars

        // Depth-2: list containing containers
        ListOfStructs
        ListOfMaps
        ListOfLists
        ListOfUnions

        // Depth-2: map containing containers
        MapOfStructs
        MapOfMaps
        MapOfLists
        MapOfUnions

        // Depth-2: sparse variants
        SparseListOfStructs
        SparseMapOfStructs

        // Depth-3: recursive shapes
        RecursiveStruct
        RecursiveUnion

        // Empty/absent body
        EmptyInputOutput
        NoInputOutput
    ]
}

// =============================================================================
// Scalar baselines
// =============================================================================

operation ScalarMembers {
    input := {
        booleanMember: Boolean
        byteMember: Byte
        shortMember: Short
        integerMember: Integer
        longMember: Long
        floatMember: Float
        doubleMember: Double
        stringMember: String
        blobMember: Blob
        @timestampFormat("date-time")
        dateTimeMember: Timestamp
        @timestampFormat("epoch-seconds")
        epochSecondsMember: Timestamp
        @timestampFormat("http-date")
        httpDateMember: Timestamp
        stringEnum: CorpusStringEnum
        intEnum: CorpusIntEnum
    }
    output := {
        booleanMember: Boolean
        byteMember: Byte
        shortMember: Short
        integerMember: Integer
        longMember: Long
        floatMember: Float
        doubleMember: Double
        stringMember: String
        blobMember: Blob
        @timestampFormat("date-time")
        dateTimeMember: Timestamp
        @timestampFormat("epoch-seconds")
        epochSecondsMember: Timestamp
        @timestampFormat("http-date")
        httpDateMember: Timestamp
        stringEnum: CorpusStringEnum
        intEnum: CorpusIntEnum
    }
}

enum CorpusStringEnum {
    FOO = "Foo"
    BAR = "Bar"
    BAZ = "Baz"
}

intEnum CorpusIntEnum {
    ONE = 1
    TWO = 2
    THREE = 3
}

// =============================================================================
// Collections of scalars
// =============================================================================

operation ListOfScalars {
    input := {
        booleans: BooleanList
        integers: IntegerList
        strings: StringList
        blobs: BlobList
        timestamps: TimestampList
        enums: CorpusStringEnumList
        intEnums: CorpusIntEnumList
    }
    output := {
        booleans: BooleanList
        integers: IntegerList
        strings: StringList
        blobs: BlobList
        timestamps: TimestampList
        enums: CorpusStringEnumList
        intEnums: CorpusIntEnumList
    }
}

operation SparseListOfScalars {
    input := {
        strings: SparseStringList
        integers: SparseIntegerList
    }
    output := {
        strings: SparseStringList
        integers: SparseIntegerList
    }
}

operation MapOfScalars {
    input := {
        booleans: BooleanMap
        integers: IntegerMap
        strings: StringMap
        blobs: BlobMap
        timestamps: TimestampMap
        enums: CorpusStringEnumMap
        intEnums: CorpusIntEnumMap
    }
    output := {
        booleans: BooleanMap
        integers: IntegerMap
        strings: StringMap
        blobs: BlobMap
        timestamps: TimestampMap
        enums: CorpusStringEnumMap
        intEnums: CorpusIntEnumMap
    }
}

operation SparseMapOfScalars {
    input := {
        strings: SparseStringMap
        integers: SparseIntegerMap
    }
    output := {
        strings: SparseStringMap
        integers: SparseIntegerMap
    }
}

// =============================================================================
// Union transitions
// =============================================================================

operation UnionOfScalars {
    input := { value: CorpusUnion }
    output := { value: CorpusUnion }
}

operation UnionOfStruct {
    input := { value: CorpusUnion }
    output := { value: CorpusUnion }
}

operation UnionOfList {
    input := { value: CorpusUnion }
    output := { value: CorpusUnion }
}

operation UnionOfMap {
    input := { value: CorpusUnion }
    output := { value: CorpusUnion }
}

operation UnionOfUnion {
    input := { value: CorpusUnion }
    output := { value: CorpusUnion }
}

union CorpusUnion {
    booleanValue: Boolean
    integerValue: Integer
    longValue: Long
    floatValue: Float
    doubleValue: Double
    stringValue: String
    blobValue: Blob
    timestampValue: Timestamp
    enumValue: CorpusStringEnum
    intEnumValue: CorpusIntEnum
    listValue: StringList
    mapValue: StringMap
    structValue: SimpleStruct
    unionValue: CorpusSubUnion
}

/// A second union type used as a variant inside CorpusUnion to test union -> union.
union CorpusSubUnion {
    stringValue: String
    integerValue: Integer
}

// =============================================================================
// Depth-1: struct containing all scalars
// =============================================================================

operation StructOfScalars {
    input := {
        value: ScalarStruct
    }
    output := {
        value: ScalarStruct
    }
}

structure ScalarStruct {
    booleanMember: Boolean
    byteMember: Byte
    shortMember: Short
    integerMember: Integer
    longMember: Long
    floatMember: Float
    doubleMember: Double
    stringMember: String
    blobMember: Blob
    @timestampFormat("date-time")
    dateTimeMember: Timestamp
    @timestampFormat("epoch-seconds")
    epochSecondsMember: Timestamp
    @timestampFormat("http-date")
    httpDateMember: Timestamp
    stringEnum: CorpusStringEnum
    intEnum: CorpusIntEnum
}

// =============================================================================
// Depth-2: list containing containers
// =============================================================================

operation ListOfStructs {
    input := {
        values: SimpleStructList
    }
    output := {
        values: SimpleStructList
    }
}

operation ListOfMaps {
    input := {
        values: ListOfStringMap
    }
    output := {
        values: ListOfStringMap
    }
}

operation ListOfLists {
    input := {
        values: ListOfStringList
    }
    output := {
        values: ListOfStringList
    }
}

operation ListOfUnions {
    input := {
        values: CorpusUnionList
    }
    output := {
        values: CorpusUnionList
    }
}

// =============================================================================
// Depth-2: map containing containers
// =============================================================================

operation MapOfStructs {
    input := {
        values: SimpleStructMap
    }
    output := {
        values: SimpleStructMap
    }
}

operation MapOfMaps {
    input := {
        values: MapOfStringMap
    }
    output := {
        values: MapOfStringMap
    }
}

operation MapOfLists {
    input := {
        values: MapOfStringList
    }
    output := {
        values: MapOfStringList
    }
}

operation MapOfUnions {
    input := {
        values: CorpusUnionMap
    }
    output := {
        values: CorpusUnionMap
    }
}

// =============================================================================
// Depth-2: sparse containers of containers
// =============================================================================

operation SparseListOfStructs {
    input := {
        values: SparseSimpleStructList
    }
    output := {
        values: SparseSimpleStructList
    }
}

operation SparseMapOfStructs {
    input := {
        values: SparseSimpleStructMap
    }
    output := {
        values: SparseSimpleStructMap
    }
}

// =============================================================================
// Depth-3: recursive shapes
// =============================================================================

operation RecursiveStruct {
    input := {
        value: RecursiveStructShape
    }
    output := {
        value: RecursiveStructShape
    }
}

structure RecursiveStructShape {
    stringMember: String
    recursiveMember: RecursiveStructShape
    recursiveList: RecursiveStructList
    recursiveMap: RecursiveStructMap
}

list RecursiveStructList {
    member: RecursiveStructShape
}

map RecursiveStructMap {
    key: String
    value: RecursiveStructShape
}

operation RecursiveUnion {
    input := {
        value: RecursiveUnionShape
    }
    output := {
        value: RecursiveUnionShape
    }
}

union RecursiveUnionShape {
    stringValue: String
    recursiveValue: RecursiveUnionShape
    structValue: RecursiveUnionStruct
}

structure RecursiveUnionStruct {
    value: RecursiveUnionShape
}

// =============================================================================
// Empty/absent body
// =============================================================================

operation EmptyInputOutput {
    input := {}
    output := {}
}

operation NoInputOutput {}

// =============================================================================
// Shared shape definitions
// =============================================================================

structure SimpleStruct {
    stringMember: String
    integerMember: Integer
    booleanMember: Boolean
}

// --- Lists ---

list BooleanList { member: Boolean }
list IntegerList { member: Integer }
list StringList { member: String }
list BlobList { member: Blob }
list TimestampList { member: Timestamp }

list DateTimeTimestampList {
    member: DateTimeTimestamp
}

list HttpDateTimestampList {
    member: HttpDateTimestamp
}

@timestampFormat("date-time")
timestamp DateTimeTimestamp

@timestampFormat("http-date")
timestamp HttpDateTimestamp

list CorpusStringEnumList { member: CorpusStringEnum }
list CorpusIntEnumList { member: CorpusIntEnum }
list SimpleStructList { member: SimpleStruct }
list ListOfStringMap { member: StringMap }
list ListOfStringList { member: StringList }
list CorpusUnionList { member: CorpusUnion }

@sparse
list SparseStringList { member: String }
@sparse
list SparseIntegerList { member: Integer }
@sparse
list SparseSimpleStructList { member: SimpleStruct }

// --- Maps ---

map BooleanMap { key: String, value: Boolean }
map IntegerMap { key: String, value: Integer }
map StringMap { key: String, value: String }
map BlobMap { key: String, value: Blob }
map TimestampMap { key: String, value: Timestamp }
map CorpusStringEnumMap { key: String, value: CorpusStringEnum }
map CorpusIntEnumMap { key: String, value: CorpusIntEnum }
map SimpleStructMap { key: String, value: SimpleStruct }
map MapOfStringMap { key: String, value: StringMap }
map MapOfStringList { key: String, value: StringList }
map CorpusUnionMap { key: String, value: CorpusUnion }

@sparse
map SparseStringMap { key: String, value: String }
@sparse
map SparseIntegerMap { key: String, value: Integer }
@sparse
map SparseSimpleStructMap { key: String, value: SimpleStruct }
