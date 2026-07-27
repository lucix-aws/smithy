$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#ec2QueryName

/// Core body serde shapes. These operations exercise the structural nesting
/// combinations that a protocol serializer/deserializer must handle. The shapes
/// are protocol-agnostic — any protocol that serializes a document body must
/// pass tests against all of these.
///
/// All members carry @jsonName and @xmlName to verify that protocols which
/// respect those traits use the wire name, and protocols that ignore them
/// (e.g. awsJson ignores @jsonName) use the member name.
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

        // Errors
        ErrorOperation
    ]
}

// =============================================================================
// Scalar baselines
// =============================================================================

operation ScalarMembers {
    input := {
        @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember") @ec2QueryName("ec2BooleanMember")
        booleanMember: Boolean
        @jsonName("jsonByteMember") @xmlName("xmlByteMember") @ec2QueryName("ec2ByteMember")
        byteMember: Byte
        @jsonName("jsonShortMember") @xmlName("xmlShortMember") @ec2QueryName("ec2ShortMember")
        shortMember: Short
        @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember") @ec2QueryName("ec2IntegerMember")
        integerMember: Integer
        @jsonName("jsonLongMember") @xmlName("xmlLongMember") @ec2QueryName("ec2LongMember")
        longMember: Long
        @jsonName("jsonFloatMember") @xmlName("xmlFloatMember") @ec2QueryName("ec2FloatMember")
        floatMember: Float
        @jsonName("jsonDoubleMember") @xmlName("xmlDoubleMember") @ec2QueryName("ec2DoubleMember")
        doubleMember: Double
        @jsonName("jsonBigIntegerMember") @xmlName("xmlBigIntegerMember") @ec2QueryName("ec2BigIntegerMember")
        bigIntegerMember: BigInteger
        @jsonName("jsonBigDecimalMember") @xmlName("xmlBigDecimalMember") @ec2QueryName("ec2BigDecimalMember")
        bigDecimalMember: BigDecimal
        @jsonName("jsonStringMember") @xmlName("xmlStringMember") @ec2QueryName("ec2StringMember")
        stringMember: String
        @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember") @ec2QueryName("ec2MediaTypeMember")
        mediaTypeMember: MediaTypeJsonString
        @jsonName("jsonBlobMember") @xmlName("xmlBlobMember") @ec2QueryName("ec2BlobMember")
        blobMember: Blob
        @jsonName("jsonDateTimeMember") @xmlName("xmlDateTimeMember") @ec2QueryName("ec2DateTimeMember")
        @timestampFormat("date-time")
        dateTimeMember: Timestamp
        @jsonName("jsonEpochSecondsMember") @xmlName("xmlEpochSecondsMember") @ec2QueryName("ec2EpochSecondsMember")
        @timestampFormat("epoch-seconds")
        epochSecondsMember: Timestamp
        @jsonName("jsonHttpDateMember") @xmlName("xmlHttpDateMember") @ec2QueryName("ec2HttpDateMember")
        @timestampFormat("http-date")
        httpDateMember: Timestamp
        @jsonName("jsonStringEnum") @xmlName("xmlStringEnum") @ec2QueryName("ec2StringEnum")
        stringEnum: CorpusStringEnum
        @jsonName("jsonIntEnum") @xmlName("xmlIntEnum") @ec2QueryName("ec2IntEnum")
        intEnum: CorpusIntEnum
    }
    output := {
        @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember") @ec2QueryName("ec2BooleanMember")
        booleanMember: Boolean
        @jsonName("jsonByteMember") @xmlName("xmlByteMember") @ec2QueryName("ec2ByteMember")
        byteMember: Byte
        @jsonName("jsonShortMember") @xmlName("xmlShortMember") @ec2QueryName("ec2ShortMember")
        shortMember: Short
        @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember") @ec2QueryName("ec2IntegerMember")
        integerMember: Integer
        @jsonName("jsonLongMember") @xmlName("xmlLongMember") @ec2QueryName("ec2LongMember")
        longMember: Long
        @jsonName("jsonFloatMember") @xmlName("xmlFloatMember") @ec2QueryName("ec2FloatMember")
        floatMember: Float
        @jsonName("jsonDoubleMember") @xmlName("xmlDoubleMember") @ec2QueryName("ec2DoubleMember")
        doubleMember: Double
        @jsonName("jsonBigIntegerMember") @xmlName("xmlBigIntegerMember") @ec2QueryName("ec2BigIntegerMember")
        bigIntegerMember: BigInteger
        @jsonName("jsonBigDecimalMember") @xmlName("xmlBigDecimalMember") @ec2QueryName("ec2BigDecimalMember")
        bigDecimalMember: BigDecimal
        @jsonName("jsonStringMember") @xmlName("xmlStringMember") @ec2QueryName("ec2StringMember")
        stringMember: String
        @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember") @ec2QueryName("ec2MediaTypeMember")
        mediaTypeMember: MediaTypeJsonString
        @jsonName("jsonBlobMember") @xmlName("xmlBlobMember") @ec2QueryName("ec2BlobMember")
        blobMember: Blob
        @jsonName("jsonDateTimeMember") @xmlName("xmlDateTimeMember") @ec2QueryName("ec2DateTimeMember")
        @timestampFormat("date-time")
        dateTimeMember: Timestamp
        @jsonName("jsonEpochSecondsMember") @xmlName("xmlEpochSecondsMember") @ec2QueryName("ec2EpochSecondsMember")
        @timestampFormat("epoch-seconds")
        epochSecondsMember: Timestamp
        @jsonName("jsonHttpDateMember") @xmlName("xmlHttpDateMember") @ec2QueryName("ec2HttpDateMember")
        @timestampFormat("http-date")
        httpDateMember: Timestamp
        @jsonName("jsonStringEnum") @xmlName("xmlStringEnum") @ec2QueryName("ec2StringEnum")
        stringEnum: CorpusStringEnum
        @jsonName("jsonIntEnum") @xmlName("xmlIntEnum") @ec2QueryName("ec2IntEnum")
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
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: BooleanList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: IntegerList
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: StringList
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: BlobList
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: TimestampList
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: CorpusStringEnumList
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: CorpusIntEnumList
    }
    output := {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: BooleanList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: IntegerList
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: StringList
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: BlobList
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: TimestampList
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: CorpusStringEnumList
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: CorpusIntEnumList
    }
}

operation SparseListOfScalars {
    input := {
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: SparseStringList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: SparseIntegerList
    }
    output := {
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: SparseStringList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: SparseIntegerList
    }
}

operation MapOfScalars {
    input := {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: BooleanMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: IntegerMap
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: StringMap
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: BlobMap
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: TimestampMap
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: CorpusStringEnumMap
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: CorpusIntEnumMap
    }
    output := {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: BooleanMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: IntegerMap
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: StringMap
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: BlobMap
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: TimestampMap
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: CorpusStringEnumMap
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: CorpusIntEnumMap
    }
}

operation SparseMapOfScalars {
    input := {
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: SparseStringMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: SparseIntegerMap
    }
    output := {
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: SparseStringMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: SparseIntegerMap
    }
}

// =============================================================================
// Union transitions
// =============================================================================

operation UnionOfScalars {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
}

operation UnionOfStruct {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
}

operation UnionOfList {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
}

operation UnionOfMap {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
}

operation UnionOfUnion {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }
}

union CorpusUnion {
    @jsonName("jsonBooleanValue") @xmlName("xmlBooleanValue")
    booleanValue: Boolean
    @jsonName("jsonIntegerValue") @xmlName("xmlIntegerValue")
    integerValue: Integer
    @jsonName("jsonLongValue") @xmlName("xmlLongValue")
    longValue: Long
    @jsonName("jsonFloatValue") @xmlName("xmlFloatValue")
    floatValue: Float
    @jsonName("jsonDoubleValue") @xmlName("xmlDoubleValue")
    doubleValue: Double
    @jsonName("jsonStringValue") @xmlName("xmlStringValue")
    stringValue: String
    @jsonName("jsonMediaTypeValue") @xmlName("xmlMediaTypeValue")
    mediaTypeValue: MediaTypeJsonString
    @jsonName("jsonBlobValue") @xmlName("xmlBlobValue")
    blobValue: Blob
    @jsonName("jsonTimestampValue") @xmlName("xmlTimestampValue")
    timestampValue: Timestamp
    @jsonName("jsonEnumValue") @xmlName("xmlEnumValue")
    enumValue: CorpusStringEnum
    @jsonName("jsonIntEnumValue") @xmlName("xmlIntEnumValue")
    intEnumValue: CorpusIntEnum
    @jsonName("jsonListValue") @xmlName("xmlListValue")
    listValue: StringList
    @jsonName("jsonMapValue") @xmlName("xmlMapValue")
    mapValue: StringMap
    @jsonName("jsonStructValue") @xmlName("xmlStructValue")
    structValue: SimpleStruct
    @jsonName("jsonUnionValue") @xmlName("xmlUnionValue")
    unionValue: CorpusSubUnion
}

/// A second union type used as a variant inside CorpusUnion to test union -> union.
union CorpusSubUnion {
    @jsonName("jsonStringValue") @xmlName("xmlStringValue")
    stringValue: String
    @jsonName("jsonIntegerValue") @xmlName("xmlIntegerValue")
    integerValue: Integer
}

// =============================================================================
// Depth-1: struct containing all scalars
// =============================================================================

operation StructOfScalars {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: ScalarStruct
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: ScalarStruct
    }
}

structure ScalarStruct {
    @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember") @ec2QueryName("ec2BooleanMember")
    booleanMember: Boolean
    @jsonName("jsonByteMember") @xmlName("xmlByteMember") @ec2QueryName("ec2ByteMember")
    byteMember: Byte
    @jsonName("jsonShortMember") @xmlName("xmlShortMember") @ec2QueryName("ec2ShortMember")
    shortMember: Short
    @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember") @ec2QueryName("ec2IntegerMember")
    integerMember: Integer
    @jsonName("jsonLongMember") @xmlName("xmlLongMember") @ec2QueryName("ec2LongMember")
    longMember: Long
    @jsonName("jsonFloatMember") @xmlName("xmlFloatMember") @ec2QueryName("ec2FloatMember")
    floatMember: Float
    @jsonName("jsonDoubleMember") @xmlName("xmlDoubleMember") @ec2QueryName("ec2DoubleMember")
    doubleMember: Double
    @jsonName("jsonBigIntegerMember") @xmlName("xmlBigIntegerMember") @ec2QueryName("ec2BigIntegerMember")
    bigIntegerMember: BigInteger
    @jsonName("jsonBigDecimalMember") @xmlName("xmlBigDecimalMember") @ec2QueryName("ec2BigDecimalMember")
    bigDecimalMember: BigDecimal
    @jsonName("jsonStringMember") @xmlName("xmlStringMember") @ec2QueryName("ec2StringMember")
    stringMember: String
    @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember") @ec2QueryName("ec2MediaTypeMember")
    mediaTypeMember: MediaTypeJsonString
    @jsonName("jsonBlobMember") @xmlName("xmlBlobMember") @ec2QueryName("ec2BlobMember")
    blobMember: Blob
    @jsonName("jsonDateTimeMember") @xmlName("xmlDateTimeMember") @ec2QueryName("ec2DateTimeMember")
    @timestampFormat("date-time")
    dateTimeMember: Timestamp
    @jsonName("jsonEpochSecondsMember") @xmlName("xmlEpochSecondsMember") @ec2QueryName("ec2EpochSecondsMember")
    @timestampFormat("epoch-seconds")
    epochSecondsMember: Timestamp
    @jsonName("jsonHttpDateMember") @xmlName("xmlHttpDateMember") @ec2QueryName("ec2HttpDateMember")
    @timestampFormat("http-date")
    httpDateMember: Timestamp
    @jsonName("jsonStringEnum") @xmlName("xmlStringEnum") @ec2QueryName("ec2StringEnum")
    stringEnum: CorpusStringEnum
    @jsonName("jsonIntEnum") @xmlName("xmlIntEnum") @ec2QueryName("ec2IntEnum")
    intEnum: CorpusIntEnum
}

// =============================================================================
// Depth-2: list containing containers
// =============================================================================

operation ListOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SimpleStructList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SimpleStructList
    }
}

operation ListOfMaps {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: ListOfStringMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: ListOfStringMap
    }
}

operation ListOfLists {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: ListOfStringList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: ListOfStringList
    }
}

operation ListOfUnions {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: CorpusUnionList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: CorpusUnionList
    }
}

// =============================================================================
// Depth-2: map containing containers
// =============================================================================

operation MapOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SimpleStructMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SimpleStructMap
    }
}

operation MapOfMaps {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: MapOfStringMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: MapOfStringMap
    }
}

operation MapOfLists {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: MapOfStringList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: MapOfStringList
    }
}

operation MapOfUnions {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: CorpusUnionMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: CorpusUnionMap
    }
}

// =============================================================================
// Depth-2: sparse containers of containers
// =============================================================================

operation SparseListOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SparseSimpleStructList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SparseSimpleStructList
    }
}

operation SparseMapOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SparseSimpleStructMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SparseSimpleStructMap
    }
}

// =============================================================================
// Depth-3: recursive shapes
// =============================================================================

operation RecursiveStruct {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: RecursiveStructShape
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: RecursiveStructShape
    }
}

structure RecursiveStructShape {
    @jsonName("jsonStringMember") @xmlName("xmlStringMember") @ec2QueryName("ec2StringMember")
    stringMember: String
    @jsonName("jsonRecursiveMember") @xmlName("xmlRecursiveMember") @ec2QueryName("ec2RecursiveMember")
    recursiveMember: RecursiveStructShape
    @jsonName("jsonRecursiveList") @xmlName("xmlRecursiveList") @ec2QueryName("ec2RecursiveList")
    recursiveList: RecursiveStructList
    @jsonName("jsonRecursiveMap") @xmlName("xmlRecursiveMap") @ec2QueryName("ec2RecursiveMap")
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
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: RecursiveUnionShape
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: RecursiveUnionShape
    }
}

union RecursiveUnionShape {
    @jsonName("jsonStringValue") @xmlName("xmlStringValue")
    stringValue: String
    @jsonName("jsonRecursiveValue") @xmlName("xmlRecursiveValue")
    recursiveValue: RecursiveUnionShape
    @jsonName("jsonStructValue") @xmlName("xmlStructValue")
    structValue: RecursiveUnionStruct
}

structure RecursiveUnionStruct {
    @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
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
// Errors
// =============================================================================

operation ErrorOperation {
    input := {}
    output := {}
    errors: [SimpleError, ComplexError]
}

@error("client")
structure SimpleError {
    @jsonName("jsonMessage") @xmlName("xmlMessage") @ec2QueryName("ec2Message")
    message: String
}

@error("server")
structure ComplexError {
    @jsonName("jsonMessage") @xmlName("xmlMessage") @ec2QueryName("ec2Message")
    message: String
    @jsonName("jsonCode") @xmlName("xmlCode") @ec2QueryName("ec2Code")
    code: Integer
    @jsonName("jsonNested") @xmlName("xmlNested") @ec2QueryName("ec2Nested")
    nested: ComplexNestedError
}

structure ComplexNestedError {
    @jsonName("jsonStringMember") @xmlName("xmlStringMember") @ec2QueryName("ec2StringMember")
    stringMember: String
    @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember") @ec2QueryName("ec2IntegerMember")
    integerMember: Integer
}

// =============================================================================
// Shared shape definitions
// =============================================================================

structure SimpleStruct {
    @jsonName("jsonStringMember") @xmlName("xmlStringMember") @ec2QueryName("ec2StringMember")
    stringMember: String
    @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember") @ec2QueryName("ec2IntegerMember")
    integerMember: Integer
    @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember") @ec2QueryName("ec2BooleanMember")
    booleanMember: Boolean
    @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember") @ec2QueryName("ec2MediaTypeMember")
    mediaTypeMember: MediaTypeJsonString
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

@mediaType("application/json")
string MediaTypeJsonString

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
