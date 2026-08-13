$version: "2.0"

namespace aws.protocoltests.corpus

// XML structural traits. Mixed into restXml, awsQuery, and ec2Query. Traits that
// change document structure get their own operations rather than being applied
// globally, which is why @xmlFlattened has a full parallel set of list and map
// operations here instead of riding along on Core.
//
// Extend with one operation per structural trait, or per trait combination where
// the combination is what's interesting (flattened plus a renamed member target).
// Naming traits that only override a wire name stay global on Core members.
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

operation FlattenedListOfScalars {
    input: FlattenedListOfScalarsInput
    output: FlattenedListOfScalarsOutput
}

structure FlattenedListOfScalarsInput {
    @xmlFlattened
    @xmlName("xmlBooleans")
    booleans: BooleanList

    @xmlFlattened
    @xmlName("xmlIntegers")
    integers: IntegerList

    @xmlFlattened
    @xmlName("xmlStrings")
    strings: StringList

    @xmlFlattened
    @xmlName("xmlBlobs")
    blobs: BlobList

    @xmlFlattened
    @xmlName("xmlTimestamps")
    timestamps: TimestampList

    @xmlFlattened
    @xmlName("xmlEnums")
    enums: CorpusStringEnumList

    @xmlFlattened
    @xmlName("xmlIntEnums")
    intEnums: CorpusIntEnumList
}

structure FlattenedListOfScalarsOutput {
    @xmlFlattened
    @xmlName("xmlBooleans")
    booleans: BooleanList

    @xmlFlattened
    @xmlName("xmlIntegers")
    integers: IntegerList

    @xmlFlattened
    @xmlName("xmlStrings")
    strings: StringList

    @xmlFlattened
    @xmlName("xmlBlobs")
    blobs: BlobList

    @xmlFlattened
    @xmlName("xmlTimestamps")
    timestamps: TimestampList

    @xmlFlattened
    @xmlName("xmlEnums")
    enums: CorpusStringEnumList

    @xmlFlattened
    @xmlName("xmlIntEnums")
    intEnums: CorpusIntEnumList
}

operation FlattenedListOfStructs {
    input: FlattenedListOfStructsInput
    output: FlattenedListOfStructsOutput
}

structure FlattenedListOfStructsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SimpleStructList
}

structure FlattenedListOfStructsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SimpleStructList
}

operation FlattenedListOfLists {
    input: FlattenedListOfListsInput
    output: FlattenedListOfListsOutput
}

structure FlattenedListOfListsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: ListOfStringList
}

structure FlattenedListOfListsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: ListOfStringList
}

operation FlattenedListOfMaps {
    input: FlattenedListOfMapsInput
    output: FlattenedListOfMapsOutput
}

structure FlattenedListOfMapsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: ListOfStringMap
}

structure FlattenedListOfMapsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: ListOfStringMap
}

operation FlattenedListOfUnions {
    input: FlattenedListOfUnionsInput
    output: FlattenedListOfUnionsOutput
}

structure FlattenedListOfUnionsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: CorpusUnionList
}

structure FlattenedListOfUnionsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: CorpusUnionList
}

operation FlattenedMapOfScalars {
    input: FlattenedMapOfScalarsInput
    output: FlattenedMapOfScalarsOutput
}

structure FlattenedMapOfScalarsInput {
    @xmlFlattened
    @xmlName("xmlBooleans")
    booleans: BooleanMap

    @xmlFlattened
    @xmlName("xmlIntegers")
    integers: IntegerMap

    @xmlFlattened
    @xmlName("xmlStrings")
    strings: StringMap

    @xmlFlattened
    @xmlName("xmlBlobs")
    blobs: BlobMap

    @xmlFlattened
    @xmlName("xmlTimestamps")
    timestamps: TimestampMap

    @xmlFlattened
    @xmlName("xmlEnums")
    enums: CorpusStringEnumMap

    @xmlFlattened
    @xmlName("xmlIntEnums")
    intEnums: CorpusIntEnumMap
}

structure FlattenedMapOfScalarsOutput {
    @xmlFlattened
    @xmlName("xmlBooleans")
    booleans: BooleanMap

    @xmlFlattened
    @xmlName("xmlIntegers")
    integers: IntegerMap

    @xmlFlattened
    @xmlName("xmlStrings")
    strings: StringMap

    @xmlFlattened
    @xmlName("xmlBlobs")
    blobs: BlobMap

    @xmlFlattened
    @xmlName("xmlTimestamps")
    timestamps: TimestampMap

    @xmlFlattened
    @xmlName("xmlEnums")
    enums: CorpusStringEnumMap

    @xmlFlattened
    @xmlName("xmlIntEnums")
    intEnums: CorpusIntEnumMap
}

operation FlattenedMapOfStructs {
    input: FlattenedMapOfStructsInput
    output: FlattenedMapOfStructsOutput
}

structure FlattenedMapOfStructsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SimpleStructMap
}

structure FlattenedMapOfStructsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SimpleStructMap
}

operation FlattenedMapOfMaps {
    input: FlattenedMapOfMapsInput
    output: FlattenedMapOfMapsOutput
}

structure FlattenedMapOfMapsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: MapOfStringMap
}

structure FlattenedMapOfMapsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: MapOfStringMap
}

operation FlattenedMapOfLists {
    input: FlattenedMapOfListsInput
    output: FlattenedMapOfListsOutput
}

structure FlattenedMapOfListsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: MapOfStringList
}

structure FlattenedMapOfListsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: MapOfStringList
}

operation FlattenedMapOfUnions {
    input: FlattenedMapOfUnionsInput
    output: FlattenedMapOfUnionsOutput
}

structure FlattenedMapOfUnionsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: CorpusUnionMap
}

structure FlattenedMapOfUnionsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: CorpusUnionMap
}

operation FlattenedSparseListOfStructs {
    input: FlattenedSparseListOfStructsInput
    output: FlattenedSparseListOfStructsOutput
}

structure FlattenedSparseListOfStructsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SparseSimpleStructList
}

structure FlattenedSparseListOfStructsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SparseSimpleStructList
}

operation FlattenedSparseMapOfStructs {
    input: FlattenedSparseMapOfStructsInput
    output: FlattenedSparseMapOfStructsOutput
}

structure FlattenedSparseMapOfStructsInput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SparseSimpleStructMap
}

structure FlattenedSparseMapOfStructsOutput {
    @xmlFlattened
    @xmlName("xmlValues")
    values: SparseSimpleStructMap
}

operation XmlAttributeMembers {
    input: XmlAttributeMembersInput
    output: XmlAttributeMembersOutput
}

structure XmlAttributeMembersInput {
    value: XmlAttributeStruct
}

structure XmlAttributeMembersOutput {
    value: XmlAttributeStruct
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

operation XmlNamespaceMembers {
    input: XmlNamespaceMembersInput
    output: XmlNamespaceMembersOutput
}

structure XmlNamespaceMembersInput {
    value: XmlNamespaceStruct
}

structure XmlNamespaceMembersOutput {
    value: XmlNamespaceStruct
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

operation XmlNamedListMembers {
    input: XmlNamedListMembersInput
    output: XmlNamedListMembersOutput
}

structure XmlNamedListMembersInput {
    @xmlName("xmlStrings")
    strings: XmlNamedStringList

    @xmlName("xmlIntegers")
    integers: XmlNamedIntegerList
}

structure XmlNamedListMembersOutput {
    @xmlName("xmlStrings")
    strings: XmlNamedStringList

    @xmlName("xmlIntegers")
    integers: XmlNamedIntegerList
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

operation XmlNamedMapMembers {
    input: XmlNamedMapMembersInput
    output: XmlNamedMapMembersOutput
}

structure XmlNamedMapMembersInput {
    @xmlName("xmlStrings")
    strings: XmlNamedStringMap

    @xmlName("xmlIntegers")
    integers: XmlNamedIntegerMap
}

structure XmlNamedMapMembersOutput {
    @xmlName("xmlStrings")
    strings: XmlNamedStringMap

    @xmlName("xmlIntegers")
    integers: XmlNamedIntegerMap
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

operation FlattenedXmlNamedListMembers {
    input: FlattenedXmlNamedListMembersInput
    output: FlattenedXmlNamedListMembersOutput
}

structure FlattenedXmlNamedListMembersInput {
    @xmlFlattened
    strings: XmlNamedStringList

    @xmlFlattened
    integers: XmlNamedIntegerList
}

structure FlattenedXmlNamedListMembersOutput {
    @xmlFlattened
    strings: XmlNamedStringList

    @xmlFlattened
    integers: XmlNamedIntegerList
}

operation FlattenedXmlNamedMapMembers {
    input: FlattenedXmlNamedMapMembersInput
    output: FlattenedXmlNamedMapMembersOutput
}

structure FlattenedXmlNamedMapMembersInput {
    @xmlFlattened
    strings: XmlNamedStringMap

    @xmlFlattened
    integers: XmlNamedIntegerMap
}

structure FlattenedXmlNamedMapMembersOutput {
    @xmlFlattened
    strings: XmlNamedStringMap

    @xmlFlattened
    integers: XmlNamedIntegerMap
}

operation XmlNameOnTargetShape {
    input: XmlNameOnTargetShapeInput
    output: XmlNameOnTargetShapeOutput
}

structure XmlNameOnTargetShapeInput {
    structTarget: XmlNameStruct

    @xmlName("xmlUnionTarget")
    unionTarget: XmlNameUnion
}

structure XmlNameOnTargetShapeOutput {
    structTarget: XmlNameStruct

    @xmlName("xmlUnionTarget")
    unionTarget: XmlNameUnion
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

operation XmlNamePrefixed {
    input: XmlNamePrefixedInput
    output: XmlNamePrefixedOutput
}

structure XmlNamePrefixedInput {
    value: XmlNamePrefixedStruct
}

structure XmlNamePrefixedOutput {
    value: XmlNamePrefixedStruct
}

@xmlNamespace(uri: "https://example.com/baz", prefix: "baz")
structure XmlNamePrefixedStruct {
    @xmlName("hello:foo")
    foo: String

    @xmlName("baz:bar")
    bar: String
}

operation XmlNamespaceOnUnion {
    input: XmlNamespaceOnUnionInput
    output: XmlNamespaceOnUnionOutput
}

structure XmlNamespaceOnUnionInput {
    @xmlName("xmlValue")
    value: XmlNamespacedUnion
}

structure XmlNamespaceOnUnionOutput {
    @xmlName("xmlValue")
    value: XmlNamespacedUnion
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
