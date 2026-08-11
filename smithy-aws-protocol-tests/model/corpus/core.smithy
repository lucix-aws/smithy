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
    input: ScalarMembersInputOutput
    output: ScalarMembersInputOutput
}

structure ScalarMembersInputOutput {
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
    input: ListOfScalarsInputOutput
    output: ListOfScalarsInputOutput
}

structure ListOfScalarsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: BooleanList
        @jsonName("jsonBytes") @xmlName("xmlBytes") @ec2QueryName("ec2Bytes")
        bytes: ByteList
        @jsonName("jsonShorts") @xmlName("xmlShorts") @ec2QueryName("ec2Shorts")
        shorts: ShortList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: IntegerList
        @jsonName("jsonLongs") @xmlName("xmlLongs") @ec2QueryName("ec2Longs")
        longs: LongList
        @jsonName("jsonFloats") @xmlName("xmlFloats") @ec2QueryName("ec2Floats")
        floats: FloatList
        @jsonName("jsonDoubles") @xmlName("xmlDoubles") @ec2QueryName("ec2Doubles")
        doubles: DoubleList
        @jsonName("jsonBigIntegers") @xmlName("xmlBigIntegers") @ec2QueryName("ec2BigIntegers")
        bigIntegers: BigIntegerList
        @jsonName("jsonBigDecimals") @xmlName("xmlBigDecimals") @ec2QueryName("ec2BigDecimals")
        bigDecimals: BigDecimalList
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

operation SparseListOfScalars {
    input: SparseListOfScalarsInputOutput
    output: SparseListOfScalarsInputOutput
}

structure SparseListOfScalarsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: SparseBooleanList
        @jsonName("jsonBytes") @xmlName("xmlBytes") @ec2QueryName("ec2Bytes")
        bytes: SparseByteList
        @jsonName("jsonShorts") @xmlName("xmlShorts") @ec2QueryName("ec2Shorts")
        shorts: SparseShortList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: SparseIntegerList
        @jsonName("jsonLongs") @xmlName("xmlLongs") @ec2QueryName("ec2Longs")
        longs: SparseLongList
        @jsonName("jsonFloats") @xmlName("xmlFloats") @ec2QueryName("ec2Floats")
        floats: SparseFloatList
        @jsonName("jsonDoubles") @xmlName("xmlDoubles") @ec2QueryName("ec2Doubles")
        doubles: SparseDoubleList
        @jsonName("jsonBigIntegers") @xmlName("xmlBigIntegers") @ec2QueryName("ec2BigIntegers")
        bigIntegers: SparseBigIntegerList
        @jsonName("jsonBigDecimals") @xmlName("xmlBigDecimals") @ec2QueryName("ec2BigDecimals")
        bigDecimals: SparseBigDecimalList
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: SparseStringList
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: SparseBlobList
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: SparseTimestampList
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: SparseCorpusStringEnumList
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: SparseCorpusIntEnumList
    }

operation MapOfScalars {
    input: MapOfScalarsInputOutput
    output: MapOfScalarsInputOutput
}

structure MapOfScalarsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: BooleanMap
        @jsonName("jsonBytes") @xmlName("xmlBytes") @ec2QueryName("ec2Bytes")
        bytes: ByteMap
        @jsonName("jsonShorts") @xmlName("xmlShorts") @ec2QueryName("ec2Shorts")
        shorts: ShortMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: IntegerMap
        @jsonName("jsonLongs") @xmlName("xmlLongs") @ec2QueryName("ec2Longs")
        longs: LongMap
        @jsonName("jsonFloats") @xmlName("xmlFloats") @ec2QueryName("ec2Floats")
        floats: FloatMap
        @jsonName("jsonDoubles") @xmlName("xmlDoubles") @ec2QueryName("ec2Doubles")
        doubles: DoubleMap
        @jsonName("jsonBigIntegers") @xmlName("xmlBigIntegers") @ec2QueryName("ec2BigIntegers")
        bigIntegers: BigIntegerMap
        @jsonName("jsonBigDecimals") @xmlName("xmlBigDecimals") @ec2QueryName("ec2BigDecimals")
        bigDecimals: BigDecimalMap
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

operation SparseMapOfScalars {
    input: SparseMapOfScalarsInputOutput
    output: SparseMapOfScalarsInputOutput
}

structure SparseMapOfScalarsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: SparseBooleanMap
        @jsonName("jsonBytes") @xmlName("xmlBytes") @ec2QueryName("ec2Bytes")
        bytes: SparseByteMap
        @jsonName("jsonShorts") @xmlName("xmlShorts") @ec2QueryName("ec2Shorts")
        shorts: SparseShortMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: SparseIntegerMap
        @jsonName("jsonLongs") @xmlName("xmlLongs") @ec2QueryName("ec2Longs")
        longs: SparseLongMap
        @jsonName("jsonFloats") @xmlName("xmlFloats") @ec2QueryName("ec2Floats")
        floats: SparseFloatMap
        @jsonName("jsonDoubles") @xmlName("xmlDoubles") @ec2QueryName("ec2Doubles")
        doubles: SparseDoubleMap
        @jsonName("jsonBigIntegers") @xmlName("xmlBigIntegers") @ec2QueryName("ec2BigIntegers")
        bigIntegers: SparseBigIntegerMap
        @jsonName("jsonBigDecimals") @xmlName("xmlBigDecimals") @ec2QueryName("ec2BigDecimals")
        bigDecimals: SparseBigDecimalMap
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: SparseStringMap
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: SparseBlobMap
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: SparseTimestampMap
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: SparseCorpusStringEnumMap
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: SparseCorpusIntEnumMap
    }

// =============================================================================
// Union transitions
// =============================================================================

operation UnionOfScalars {
    input: UnionOfScalarsInputOutput
    output: UnionOfScalarsInputOutput
}

structure UnionOfScalarsInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }

operation UnionOfStruct {
    input: UnionOfStructInputOutput
    output: UnionOfStructInputOutput
}

structure UnionOfStructInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }

operation UnionOfList {
    input: UnionOfListInputOutput
    output: UnionOfListInputOutput
}

structure UnionOfListInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }

operation UnionOfMap {
    input: UnionOfMapInputOutput
    output: UnionOfMapInputOutput
}

structure UnionOfMapInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
    }

operation UnionOfUnion {
    input: UnionOfUnionInputOutput
    output: UnionOfUnionInputOutput
}

structure UnionOfUnionInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: CorpusUnion
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
    input: StructOfScalarsInputOutput
    output: StructOfScalarsInputOutput
}

structure StructOfScalarsInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: ScalarStruct
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
    input: ListOfStructsInputOutput
    output: ListOfStructsInputOutput
}

structure ListOfStructsInputOutput {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SimpleStructList
    }

operation ListOfMaps {
    input: ListOfMapsInputOutput
    output: ListOfMapsInputOutput
}

structure ListOfMapsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: ListOfBooleanMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: ListOfIntegerMap
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: ListOfStringMap
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: ListOfBlobMap
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: ListOfTimestampMap
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: ListOfCorpusStringEnumMap
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: ListOfCorpusIntEnumMap
    }

operation ListOfLists {
    input: ListOfListsInputOutput
    output: ListOfListsInputOutput
}

structure ListOfListsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: ListOfBooleanList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: ListOfIntegerList
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: ListOfStringList
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: ListOfBlobList
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: ListOfTimestampList
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: ListOfCorpusStringEnumList
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: ListOfCorpusIntEnumList
    }

operation ListOfUnions {
    input: ListOfUnionsInputOutput
    output: ListOfUnionsInputOutput
}

structure ListOfUnionsInputOutput {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: CorpusUnionList
    }

// =============================================================================
// Depth-2: map containing containers
// =============================================================================

operation MapOfStructs {
    input: MapOfStructsInputOutput
    output: MapOfStructsInputOutput
}

structure MapOfStructsInputOutput {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SimpleStructMap
    }

operation MapOfMaps {
    input: MapOfMapsInputOutput
    output: MapOfMapsInputOutput
}

structure MapOfMapsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: MapOfBooleanMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: MapOfIntegerMap
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: MapOfStringMap
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: MapOfBlobMap
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: MapOfTimestampMap
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: MapOfCorpusStringEnumMap
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: MapOfCorpusIntEnumMap
    }

operation MapOfLists {
    input: MapOfListsInputOutput
    output: MapOfListsInputOutput
}

structure MapOfListsInputOutput {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans") @ec2QueryName("ec2Booleans")
        booleans: MapOfBooleanList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers") @ec2QueryName("ec2Integers")
        integers: MapOfIntegerList
        @jsonName("jsonStrings") @xmlName("xmlStrings") @ec2QueryName("ec2Strings")
        strings: MapOfStringList
        @jsonName("jsonBlobs") @xmlName("xmlBlobs") @ec2QueryName("ec2Blobs")
        blobs: MapOfBlobList
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps") @ec2QueryName("ec2Timestamps")
        timestamps: MapOfTimestampList
        @jsonName("jsonEnums") @xmlName("xmlEnums") @ec2QueryName("ec2Enums")
        enums: MapOfCorpusStringEnumList
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums") @ec2QueryName("ec2IntEnums")
        intEnums: MapOfCorpusIntEnumList
    }

operation MapOfUnions {
    input: MapOfUnionsInputOutput
    output: MapOfUnionsInputOutput
}

structure MapOfUnionsInputOutput {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: CorpusUnionMap
    }

// =============================================================================
// Depth-2: sparse containers of containers
// =============================================================================

operation SparseListOfStructs {
    input: SparseListOfStructsInputOutput
    output: SparseListOfStructsInputOutput
}

structure SparseListOfStructsInputOutput {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SparseSimpleStructList
    }

operation SparseMapOfStructs {
    input: SparseMapOfStructsInputOutput
    output: SparseMapOfStructsInputOutput
}

structure SparseMapOfStructsInputOutput {
        @jsonName("jsonValues") @xmlName("xmlValues") @ec2QueryName("ec2Values")
        values: SparseSimpleStructMap
    }

// =============================================================================
// Depth-3: recursive shapes
// =============================================================================

operation RecursiveStruct {
    input: RecursiveStructInputOutput
    output: RecursiveStructInputOutput
}

structure RecursiveStructInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: RecursiveStructShape
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
    input: RecursiveUnionInputOutput
    output: RecursiveUnionInputOutput
}

structure RecursiveUnionInputOutput {
        @jsonName("jsonValue") @xmlName("xmlValue") @ec2QueryName("ec2Value")
        value: RecursiveUnionShape
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
list ByteList { member: Byte }
list ShortList { member: Short }
list IntegerList { member: Integer }
list LongList { member: Long }
list FloatList { member: Float }
list DoubleList { member: Double }
list BigIntegerList { member: BigInteger }
list BigDecimalList { member: BigDecimal }
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
list ListOfBooleanList { member: BooleanList }
list ListOfIntegerList { member: IntegerList }
list ListOfStringList { member: StringList }
list ListOfBlobList { member: BlobList }
list ListOfTimestampList { member: TimestampList }
list ListOfCorpusStringEnumList { member: CorpusStringEnumList }
list ListOfCorpusIntEnumList { member: CorpusIntEnumList }
list ListOfBooleanMap { member: BooleanMap }
list ListOfIntegerMap { member: IntegerMap }
list ListOfStringMap { member: StringMap }
list ListOfBlobMap { member: BlobMap }
list ListOfTimestampMap { member: TimestampMap }
list ListOfCorpusStringEnumMap { member: CorpusStringEnumMap }
list ListOfCorpusIntEnumMap { member: CorpusIntEnumMap }
list CorpusUnionList { member: CorpusUnion }

@sparse
list SparseBooleanList { member: Boolean }
@sparse
list SparseByteList { member: Byte }
@sparse
list SparseShortList { member: Short }
@sparse
list SparseIntegerList { member: Integer }
@sparse
list SparseLongList { member: Long }
@sparse
list SparseFloatList { member: Float }
@sparse
list SparseDoubleList { member: Double }
@sparse
list SparseBigIntegerList { member: BigInteger }
@sparse
list SparseBigDecimalList { member: BigDecimal }
@sparse
list SparseStringList { member: String }
@sparse
list SparseBlobList { member: Blob }
@sparse
list SparseTimestampList { member: Timestamp }
@sparse
list SparseCorpusStringEnumList { member: CorpusStringEnum }
@sparse
list SparseCorpusIntEnumList { member: CorpusIntEnum }
@sparse
list SparseSimpleStructList { member: SimpleStruct }

// --- Maps ---

map BooleanMap { key: String, value: Boolean }
map ByteMap { key: String, value: Byte }
map ShortMap { key: String, value: Short }
map IntegerMap { key: String, value: Integer }
map LongMap { key: String, value: Long }
map FloatMap { key: String, value: Float }
map DoubleMap { key: String, value: Double }
map BigIntegerMap { key: String, value: BigInteger }
map BigDecimalMap { key: String, value: BigDecimal }
map StringMap { key: String, value: String }
map BlobMap { key: String, value: Blob }
map TimestampMap { key: String, value: Timestamp }
map CorpusStringEnumMap { key: String, value: CorpusStringEnum }
map CorpusIntEnumMap { key: String, value: CorpusIntEnum }
map SimpleStructMap { key: String, value: SimpleStruct }
map MapOfBooleanList { key: String, value: BooleanList }
map MapOfIntegerList { key: String, value: IntegerList }
map MapOfStringList { key: String, value: StringList }
map MapOfBlobList { key: String, value: BlobList }
map MapOfTimestampList { key: String, value: TimestampList }
map MapOfCorpusStringEnumList { key: String, value: CorpusStringEnumList }
map MapOfCorpusIntEnumList { key: String, value: CorpusIntEnumList }
map MapOfBooleanMap { key: String, value: BooleanMap }
map MapOfIntegerMap { key: String, value: IntegerMap }
map MapOfStringMap { key: String, value: StringMap }
map MapOfBlobMap { key: String, value: BlobMap }
map MapOfTimestampMap { key: String, value: TimestampMap }
map MapOfCorpusStringEnumMap { key: String, value: CorpusStringEnumMap }
map MapOfCorpusIntEnumMap { key: String, value: CorpusIntEnumMap }
map CorpusUnionMap { key: String, value: CorpusUnion }

@sparse
map SparseBooleanMap { key: String, value: Boolean }
@sparse
map SparseByteMap { key: String, value: Byte }
@sparse
map SparseShortMap { key: String, value: Short }
@sparse
map SparseIntegerMap { key: String, value: Integer }
@sparse
map SparseLongMap { key: String, value: Long }
@sparse
map SparseFloatMap { key: String, value: Float }
@sparse
map SparseDoubleMap { key: String, value: Double }
@sparse
map SparseBigIntegerMap { key: String, value: BigInteger }
@sparse
map SparseBigDecimalMap { key: String, value: BigDecimal }
@sparse
map SparseStringMap { key: String, value: String }
@sparse
map SparseBlobMap { key: String, value: Blob }
@sparse
map SparseTimestampMap { key: String, value: Timestamp }
@sparse
map SparseCorpusStringEnumMap { key: String, value: CorpusStringEnum }
@sparse
map SparseCorpusIntEnumMap { key: String, value: CorpusIntEnum }
@sparse
map SparseSimpleStructMap { key: String, value: SimpleStruct }
