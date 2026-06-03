$version: "2.0"

namespace aws.protocoltests.corpus

/// XML-specific serialization traits. These operations mirror the list/map
/// transitions from CoreProtocolTestService but with @xmlFlattened applied.
/// Only mixed into XML-based protocol services (restXml, awsQuery, ec2Query).
@mixin
service XmlTraitsProtocolTestService with [CoreProtocolTestService] {
    operations: [
        FlattenedListOfScalars
        FlattenedListOfStructs
        FlattenedListOfLists
        FlattenedListOfMaps
        FlattenedListOfUnions
        FlattenedMapOfScalars
        FlattenedMapOfStructs
        FlattenedMapOfMaps
        FlattenedMapOfLists
        FlattenedMapOfUnions
        FlattenedSparseListOfStructs
        FlattenedSparseMapOfStructs
    ]
}

// =============================================================================
// Flattened lists
// =============================================================================

operation FlattenedListOfScalars {
    input := {
        @xmlFlattened @xmlName("xmlBooleans")
        booleans: BooleanList
        @xmlFlattened @xmlName("xmlIntegers")
        integers: IntegerList
        @xmlFlattened @xmlName("xmlStrings")
        strings: StringList
        @xmlFlattened @xmlName("xmlBlobs")
        blobs: BlobList
        @xmlFlattened @xmlName("xmlTimestamps")
        timestamps: TimestampList
        @xmlFlattened @xmlName("xmlEnums")
        enums: CorpusStringEnumList
        @xmlFlattened @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumList
    }
    output := {
        @xmlFlattened @xmlName("xmlBooleans")
        booleans: BooleanList
        @xmlFlattened @xmlName("xmlIntegers")
        integers: IntegerList
        @xmlFlattened @xmlName("xmlStrings")
        strings: StringList
        @xmlFlattened @xmlName("xmlBlobs")
        blobs: BlobList
        @xmlFlattened @xmlName("xmlTimestamps")
        timestamps: TimestampList
        @xmlFlattened @xmlName("xmlEnums")
        enums: CorpusStringEnumList
        @xmlFlattened @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumList
    }
}

operation FlattenedListOfStructs {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: SimpleStructList
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: SimpleStructList
    }
}

operation FlattenedListOfLists {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: ListOfStringList
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: ListOfStringList
    }
}

operation FlattenedListOfMaps {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: ListOfStringMap
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: ListOfStringMap
    }
}

operation FlattenedListOfUnions {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: CorpusUnionList
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: CorpusUnionList
    }
}

// =============================================================================
// Flattened maps
// =============================================================================

operation FlattenedMapOfScalars {
    input := {
        @xmlFlattened @xmlName("xmlBooleans")
        booleans: BooleanMap
        @xmlFlattened @xmlName("xmlIntegers")
        integers: IntegerMap
        @xmlFlattened @xmlName("xmlStrings")
        strings: StringMap
        @xmlFlattened @xmlName("xmlBlobs")
        blobs: BlobMap
        @xmlFlattened @xmlName("xmlTimestamps")
        timestamps: TimestampMap
        @xmlFlattened @xmlName("xmlEnums")
        enums: CorpusStringEnumMap
        @xmlFlattened @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumMap
    }
    output := {
        @xmlFlattened @xmlName("xmlBooleans")
        booleans: BooleanMap
        @xmlFlattened @xmlName("xmlIntegers")
        integers: IntegerMap
        @xmlFlattened @xmlName("xmlStrings")
        strings: StringMap
        @xmlFlattened @xmlName("xmlBlobs")
        blobs: BlobMap
        @xmlFlattened @xmlName("xmlTimestamps")
        timestamps: TimestampMap
        @xmlFlattened @xmlName("xmlEnums")
        enums: CorpusStringEnumMap
        @xmlFlattened @xmlName("xmlIntEnums")
        intEnums: CorpusIntEnumMap
    }
}

operation FlattenedMapOfStructs {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: SimpleStructMap
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: SimpleStructMap
    }
}

operation FlattenedMapOfMaps {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: MapOfStringMap
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: MapOfStringMap
    }
}

operation FlattenedMapOfLists {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: MapOfStringList
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: MapOfStringList
    }
}

operation FlattenedMapOfUnions {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: CorpusUnionMap
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: CorpusUnionMap
    }
}

// =============================================================================
// Flattened sparse containers
// =============================================================================

operation FlattenedSparseListOfStructs {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: SparseSimpleStructList
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: SparseSimpleStructList
    }
}

operation FlattenedSparseMapOfStructs {
    input := {
        @xmlFlattened @xmlName("xmlValues")
        values: SparseSimpleStructMap
    }
    output := {
        @xmlFlattened @xmlName("xmlValues")
        values: SparseSimpleStructMap
    }
}
