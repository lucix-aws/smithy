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
        XmlNameOnTargetShape
        XmlNamePrefixed
        XmlNamespaceOnUnion
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

// =============================================================================
// @xmlName on a structure/union SHAPE — renames that shape's own root element,
// but MUST NOT influence the element name of a member that targets it. The
// member name (or member-level @xmlName) always wins; the target shape's
// @xmlName must never appear on the wire for the member element.
// =============================================================================

operation XmlNameOnTargetShape {
    input := {
        // No member-level @xmlName: element must be the member name "structTarget",
        // never the target shape's @xmlName ("ShouldNotAppearStruct").
        structTarget: XmlNameStruct
        // Member-level @xmlName present: element must be "xmlUnionTarget",
        // never the target union's @xmlName ("ShouldNotAppearUnion").
        @xmlName("xmlUnionTarget")
        unionTarget: XmlNameUnion
    }
    output := {
        structTarget: XmlNameStruct
        @xmlName("xmlUnionTarget")
        unionTarget: XmlNameUnion
    }
}

@xmlName("ShouldNotAppearStruct")
structure XmlNameStruct {
    @xmlName("xmlStringMember")
    stringMember: String
}

@xmlName("ShouldNotAppearUnion")
union XmlNameUnion {
    @xmlName("xmlStringValue")
    stringValue: String
    @xmlName("xmlIntegerValue")
    integerValue: Integer
}

// =============================================================================
// @xmlName with an embedded namespace prefix — the value adheres to the
// XmlName ABNF (XmlIdentifier ":" XmlIdentifier) and inserts a prefix before
// the element name. Two cases:
//   (a) bare prefix with no matching declaration ("hello:foo")
//   (b) prefix matching a @xmlNamespace prefix declared on the enclosing struct
//       ("baz:bar" against xmlns:baz)
// =============================================================================

operation XmlNamePrefixed {
    input := {
        value: XmlNamePrefixedStruct
    }
    output := {
        value: XmlNamePrefixedStruct
    }
}

@xmlNamespace(uri: "https://example.com/baz", prefix: "baz")
structure XmlNamePrefixedStruct {
    // Bare prefixed name, no matching declared namespace prefix.
    @xmlName("hello:foo")
    foo: String

    // Prefixed name matching the struct's declared "baz" namespace prefix.
    @xmlName("baz:bar")
    bar: String
}

// =============================================================================
// @xmlNamespace on a UNION shape — the xmlNamespace selector permits unions.
// Verifies namespace declaration propagates onto the union's serialized element.
// =============================================================================

operation XmlNamespaceOnUnion {
    input := {
        @xmlName("xmlValue")
        value: XmlNamespacedUnion
    }
    output := {
        @xmlName("xmlValue")
        value: XmlNamespacedUnion
    }
}

@xmlNamespace(uri: "https://example.com/union")
union XmlNamespacedUnion {
    @xmlName("xmlStringValue")
    stringValue: String
    @xmlName("xmlIntegerValue")
    integerValue: Integer
    @xmlName("xmlStructValue")
    structValue: SimpleStruct
}
