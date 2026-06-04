$version: "2.0"

namespace aws.protocoltests.corpus

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
    ]
}

// =============================================================================
// Scalar baselines
// =============================================================================

operation ScalarMembers {
    input := {
        @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember")
        booleanMember: Boolean
        @jsonName("jsonByteMember") @xmlName("xmlByteMember")
        byteMember: Byte
        @jsonName("jsonShortMember") @xmlName("xmlShortMember")
        shortMember: Short
        @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember")
        integerMember: Integer
        @jsonName("jsonLongMember") @xmlName("xmlLongMember")
        longMember: Long
        @jsonName("jsonFloatMember") @xmlName("xmlFloatMember")
        floatMember: Float
        @jsonName("jsonDoubleMember") @xmlName("xmlDoubleMember")
        doubleMember: Double
        @jsonName("jsonStringMember") @xmlName("xmlStringMember")
        stringMember: String
        @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember")
        mediaTypeMember: MediaTypeJsonString
        @jsonName("jsonBlobMember") @xmlName("xmlBlobMember")
        blobMember: Blob
        @jsonName("jsonDateTimeMember") @xmlName("xmlDateTimeMember")
        @timestampFormat("date-time")
        dateTimeMember: Timestamp
        @jsonName("jsonEpochSecondsMember") @xmlName("xmlEpochSecondsMember")
        @timestampFormat("epoch-seconds")
        epochSecondsMember: Timestamp
        @jsonName("jsonHttpDateMember") @xmlName("xmlHttpDateMember")
        @timestampFormat("http-date")
        httpDateMember: Timestamp
        @jsonName("jsonStringEnum") @xmlName("xmlStringEnum")
        stringEnum: CorpusStringEnum
        @jsonName("jsonIntEnum") @xmlName("xmlIntEnum")
        intEnum: CorpusIntEnum
    }
    output := {
        @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember")
        booleanMember: Boolean
        @jsonName("jsonByteMember") @xmlName("xmlByteMember")
        byteMember: Byte
        @jsonName("jsonShortMember") @xmlName("xmlShortMember")
        shortMember: Short
        @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember")
        integerMember: Integer
        @jsonName("jsonLongMember") @xmlName("xmlLongMember")
        longMember: Long
        @jsonName("jsonFloatMember") @xmlName("xmlFloatMember")
        floatMember: Float
        @jsonName("jsonDoubleMember") @xmlName("xmlDoubleMember")
        doubleMember: Double
        @jsonName("jsonStringMember") @xmlName("xmlStringMember")
        stringMember: String
        @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember")
        mediaTypeMember: MediaTypeJsonString
        @jsonName("jsonBlobMember") @xmlName("xmlBlobMember")
        blobMember: Blob
        @jsonName("jsonDateTimeMember") @xmlName("xmlDateTimeMember")
        @timestampFormat("date-time")
        dateTimeMember: Timestamp
        @jsonName("jsonEpochSecondsMember") @xmlName("xmlEpochSecondsMember")
        @timestampFormat("epoch-seconds")
        epochSecondsMember: Timestamp
        @jsonName("jsonHttpDateMember") @xmlName("xmlHttpDateMember")
        @timestampFormat("http-date")
        httpDateMember: Timestamp
        @jsonName("jsonStringEnum") @xmlName("xmlStringEnum")
        stringEnum: CorpusStringEnum
        @jsonName("jsonIntEnum") @xmlName("xmlIntEnum")
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
        @jsonName("jsonBooleans") @xmlName("xmlBooleans")
        booleans: BooleanList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: IntegerList
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: StringList
        @jsonName("jsonBlobs") @xmlName("xmlBlobs")
        blobs: BlobList
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps")
        timestamps: TimestampList
        @jsonName("jsonEnums") @xmlName("xmlEnums")
        enums: CorpusStringEnumList
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumList
    }
    output := {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans")
        booleans: BooleanList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: IntegerList
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: StringList
        @jsonName("jsonBlobs") @xmlName("xmlBlobs")
        blobs: BlobList
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps")
        timestamps: TimestampList
        @jsonName("jsonEnums") @xmlName("xmlEnums")
        enums: CorpusStringEnumList
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumList
    }
}

operation SparseListOfScalars {
    input := {
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: SparseStringList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: SparseIntegerList
    }
    output := {
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: SparseStringList
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: SparseIntegerList
    }
}

operation MapOfScalars {
    input := {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans")
        booleans: BooleanMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: IntegerMap
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: StringMap
        @jsonName("jsonBlobs") @xmlName("xmlBlobs")
        blobs: BlobMap
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps")
        timestamps: TimestampMap
        @jsonName("jsonEnums") @xmlName("xmlEnums")
        enums: CorpusStringEnumMap
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumMap
    }
    output := {
        @jsonName("jsonBooleans") @xmlName("xmlBooleans")
        booleans: BooleanMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: IntegerMap
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: StringMap
        @jsonName("jsonBlobs") @xmlName("xmlBlobs")
        blobs: BlobMap
        @jsonName("jsonTimestamps") @xmlName("xmlTimestamps")
        timestamps: TimestampMap
        @jsonName("jsonEnums") @xmlName("xmlEnums")
        enums: CorpusStringEnumMap
        @jsonName("jsonIntEnums") @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumMap
    }
}

operation SparseMapOfScalars {
    input := {
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: SparseStringMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: SparseIntegerMap
    }
    output := {
        @jsonName("jsonStrings") @xmlName("xmlStrings")
        strings: SparseStringMap
        @jsonName("jsonIntegers") @xmlName("xmlIntegers")
        integers: SparseIntegerMap
    }
}

// =============================================================================
// Union transitions
// =============================================================================

operation UnionOfScalars {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
}

operation UnionOfStruct {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
}

operation UnionOfList {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
}

operation UnionOfMap {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
}

operation UnionOfUnion {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: CorpusUnion
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
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
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: ScalarStruct
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: ScalarStruct
    }
}

structure ScalarStruct {
    @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember")
    booleanMember: Boolean
    @jsonName("jsonByteMember") @xmlName("xmlByteMember")
    byteMember: Byte
    @jsonName("jsonShortMember") @xmlName("xmlShortMember")
    shortMember: Short
    @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember")
    integerMember: Integer
    @jsonName("jsonLongMember") @xmlName("xmlLongMember")
    longMember: Long
    @jsonName("jsonFloatMember") @xmlName("xmlFloatMember")
    floatMember: Float
    @jsonName("jsonDoubleMember") @xmlName("xmlDoubleMember")
    doubleMember: Double
    @jsonName("jsonStringMember") @xmlName("xmlStringMember")
    stringMember: String
    @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember")
    mediaTypeMember: MediaTypeJsonString
    @jsonName("jsonBlobMember") @xmlName("xmlBlobMember")
    blobMember: Blob
    @jsonName("jsonDateTimeMember") @xmlName("xmlDateTimeMember")
    @timestampFormat("date-time")
    dateTimeMember: Timestamp
    @jsonName("jsonEpochSecondsMember") @xmlName("xmlEpochSecondsMember")
    @timestampFormat("epoch-seconds")
    epochSecondsMember: Timestamp
    @jsonName("jsonHttpDateMember") @xmlName("xmlHttpDateMember")
    @timestampFormat("http-date")
    httpDateMember: Timestamp
    @jsonName("jsonStringEnum") @xmlName("xmlStringEnum")
    stringEnum: CorpusStringEnum
    @jsonName("jsonIntEnum") @xmlName("xmlIntEnum")
    intEnum: CorpusIntEnum
}

// =============================================================================
// Depth-2: list containing containers
// =============================================================================

operation ListOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SimpleStructList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SimpleStructList
    }
}

operation ListOfMaps {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: ListOfStringMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: ListOfStringMap
    }
}

operation ListOfLists {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: ListOfStringList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: ListOfStringList
    }
}

operation ListOfUnions {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: CorpusUnionList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: CorpusUnionList
    }
}

// =============================================================================
// Depth-2: map containing containers
// =============================================================================

operation MapOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SimpleStructMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SimpleStructMap
    }
}

operation MapOfMaps {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: MapOfStringMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: MapOfStringMap
    }
}

operation MapOfLists {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: MapOfStringList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: MapOfStringList
    }
}

operation MapOfUnions {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: CorpusUnionMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: CorpusUnionMap
    }
}

// =============================================================================
// Depth-2: sparse containers of containers
// =============================================================================

operation SparseListOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SparseSimpleStructList
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SparseSimpleStructList
    }
}

operation SparseMapOfStructs {
    input := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SparseSimpleStructMap
    }
    output := {
        @jsonName("jsonValues") @xmlName("xmlValues")
        values: SparseSimpleStructMap
    }
}

// =============================================================================
// Depth-3: recursive shapes
// =============================================================================

operation RecursiveStruct {
    input := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: RecursiveStructShape
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: RecursiveStructShape
    }
}

structure RecursiveStructShape {
    @jsonName("jsonStringMember") @xmlName("xmlStringMember")
    stringMember: String
    @jsonName("jsonRecursiveMember") @xmlName("xmlRecursiveMember")
    recursiveMember: RecursiveStructShape
    @jsonName("jsonRecursiveList") @xmlName("xmlRecursiveList")
    recursiveList: RecursiveStructList
    @jsonName("jsonRecursiveMap") @xmlName("xmlRecursiveMap")
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
        @jsonName("jsonValue") @xmlName("xmlValue")
        value: RecursiveUnionShape
    }
    output := {
        @jsonName("jsonValue") @xmlName("xmlValue")
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
    @jsonName("jsonValue") @xmlName("xmlValue")
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
    @jsonName("jsonStringMember") @xmlName("xmlStringMember")
    stringMember: String
    @jsonName("jsonIntegerMember") @xmlName("xmlIntegerMember")
    integerMember: Integer
    @jsonName("jsonBooleanMember") @xmlName("xmlBooleanMember")
    booleanMember: Boolean
    @jsonName("jsonMediaTypeMember") @xmlName("xmlMediaTypeMember")
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
