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
        XmlAttributeMembers
        XmlNamespaceMembers
        XmlNamedListMembers
        XmlNamedMapMembers
        FlattenedXmlNamedListMembers
        FlattenedXmlNamedMapMembers
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

// =============================================================================
// @xmlAttribute — scalar members serialized as XML attributes
// =============================================================================

operation XmlAttributeMembers {
    input := {
        value: XmlAttributeStruct
    }
    output := {
        value: XmlAttributeStruct
    }
}

structure XmlAttributeStruct {
    @xmlAttribute
    @xmlName("id")
    id: String

    @xmlAttribute
    @xmlName("enabled")
    enabled: Boolean

    @xmlName("xmlContent")
    content: String

    @xmlName("xmlNested")
    nested: XmlAttributeNestedStruct
}

structure XmlAttributeNestedStruct {
    @xmlAttribute
    @xmlName("name")
    name: String

    @xmlName("xmlValue")
    value: String
}

// =============================================================================
// @xmlNamespace — xmlns declarations on structs and members
// =============================================================================

operation XmlNamespaceMembers {
    input := {
        value: XmlNamespaceStruct
    }
    output := {
        value: XmlNamespaceStruct
    }
}

@xmlNamespace(uri: "https://example.com/ns")
structure XmlNamespaceStruct {
    @xmlName("xmlName")
    name: String

    @xmlNamespace(uri: "https://example.com/nested", prefix: "nested")
    @xmlName("xmlNested")
    nested: XmlNamespaceNestedStruct

    @xmlNamespace(uri: "https://example.com/list")
    @xmlName("xmlValues")
    values: StringList
}

@xmlNamespace(uri: "https://example.com/nested", prefix: "nested")
structure XmlNamespaceNestedStruct {
    @xmlName("xmlValue")
    value: String
}

// =============================================================================
// @xmlName on list member — changes the element name inside the wrapper
// =============================================================================

operation XmlNamedListMembers {
    input := {
        @xmlName("xmlStrings")
        strings: XmlNamedStringList
        @xmlName("xmlIntegers")
        integers: XmlNamedIntegerList
    }
    output := {
        @xmlName("xmlStrings")
        strings: XmlNamedStringList
        @xmlName("xmlIntegers")
        integers: XmlNamedIntegerList
    }
}

@xmlNamespace(uri: "https://xml-list.example.com")
list XmlNamedStringList {
    @xmlName("item")
    member: String
}

@xmlNamespace(uri: "https://xml-list.example.com")
list XmlNamedIntegerList {
    @xmlName("item")
    member: Integer
}

// =============================================================================
// @xmlName on map key/value — changes key/value element names inside entry
// =============================================================================

operation XmlNamedMapMembers {
    input := {
        @xmlName("xmlStrings")
        strings: XmlNamedStringMap
        @xmlName("xmlIntegers")
        integers: XmlNamedIntegerMap
    }
    output := {
        @xmlName("xmlStrings")
        strings: XmlNamedStringMap
        @xmlName("xmlIntegers")
        integers: XmlNamedIntegerMap
    }
}

@xmlNamespace(uri: "https://xml-map.example.com")
map XmlNamedStringMap {
    @xmlName("AttrKey")
    key: String
    @xmlName("AttrValue")
    value: String
}

@xmlNamespace(uri: "https://xml-map.example.com")
map XmlNamedIntegerMap {
    @xmlName("AttrKey")
    key: String
    @xmlName("AttrValue")
    value: Integer
}

// =============================================================================
// @xmlFlattened + @xmlName on list/map member target — the member-level xmlName
// becomes the repeated element name when flattened
// =============================================================================

operation FlattenedXmlNamedListMembers {
    input := {
        @xmlFlattened
        strings: XmlNamedStringList
        @xmlFlattened
        integers: XmlNamedIntegerList
    }
    output := {
        @xmlFlattened
        strings: XmlNamedStringList
        @xmlFlattened
        integers: XmlNamedIntegerList
    }
}

operation FlattenedXmlNamedMapMembers {
    input := {
        @xmlFlattened
        strings: XmlNamedStringMap
        @xmlFlattened
        integers: XmlNamedIntegerMap
    }
    output := {
        @xmlFlattened
        strings: XmlNamedStringMap
        @xmlFlattened
        integers: XmlNamedIntegerMap
    }
}