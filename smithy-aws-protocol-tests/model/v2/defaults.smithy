$version: "2.0"

namespace aws.protocoltests.corpus

// Value semantics: when a member is omitted, when it's populated from @default,
// and what a null on the wire means. This is where implementations diverge most,
// so the operations are split by the trait combination under test rather than by
// shape.
//
// Extend by adding an operation for a distinct presence or default behavior. The
// cases here carry the presence and defaults tags, so a consumer that hasn't
// implemented @default can filter them out.
@mixin
service DefaultsProtocolTestService with [CoreProtocolTestService] {
    operations: [
        DefaultScalars
        DefaultCollections
        NestedDefaults
        RequiredMembers
        NullSparseMembers
        ClientOptionalDefaults
    ]
}

operation DefaultScalars {
    input: DefaultScalarsInput
    output: DefaultScalarsOutput
}

structure DefaultScalarsInput with [DefaultScalarsMixin] {}

structure DefaultScalarsOutput with [DefaultScalarsMixin] {}

@mixin
structure DefaultScalarsMixin {
    @default(false)
    defaultBoolean: Boolean

    @default(0)
    defaultByte: Byte

    @default(0)
    defaultShort: Short

    @default(0)
    defaultInteger: Integer

    @default(0)
    defaultLong: Long

    @default(0)
    defaultFloat: Float

    @default(0)
    defaultDouble: Double

    @default("")
    defaultString: String

    @default("")
    defaultBlob: Blob

    @default("Foo")
    defaultEnum: CorpusStringEnum

    @default(1)
    defaultIntEnum: CorpusIntEnum

    @default(false)
    zeroBoolean: Boolean

    @default(0)
    zeroByte: Byte

    @default(0)
    zeroShort: Short

    @default(0)
    zeroInteger: Integer

    @default(0)
    zeroLong: Long

    @default(0)
    zeroFloat: Float

    @default(0)
    zeroDouble: Double

    @default("")
    emptyString: String

    @default("")
    emptyBlob: Blob
}

operation DefaultCollections {
    input: DefaultCollectionsInput
    output: DefaultCollectionsOutput
}

structure DefaultCollectionsInput with [DefaultCollectionsMixin] {}

structure DefaultCollectionsOutput with [DefaultCollectionsMixin] {}

@mixin
structure DefaultCollectionsMixin {
    @default([])
    defaultList: StringList

    @default({})
    defaultMap: StringMap
}

operation NestedDefaults {
    input: NestedDefaultsInput
    output: NestedDefaultsOutput
}

structure NestedDefaultsInput {
    topLevel: TopLevelWithDefaults
}

structure NestedDefaultsOutput {
    topLevel: TopLevelWithDefaults
}

structure TopLevelWithDefaults {
    @required
    nested: NestedWithDefaults

    nestedList: NestedWithDefaultsList

    nestedMap: NestedWithDefaultsMap
}

structure NestedWithDefaults {
    @default("hello")
    greeting: String

    @default(0)
    count: Integer

    inner: InnerWithDefaults
}

structure InnerWithDefaults {
    @default("goodbye")
    farewell: String
}

list NestedWithDefaultsList {
    member: NestedWithDefaults
}

map NestedWithDefaultsMap {
    key: String
    value: NestedWithDefaults
}

operation RequiredMembers {
    input: RequiredMembersInput
    output: RequiredMembersOutput
}

structure RequiredMembersInput with [RequiredMembersMixin] {}

structure RequiredMembersOutput with [RequiredMembersMixin] {}

@mixin
structure RequiredMembersMixin {
    @required
    requiredString: String

    @required
    requiredInteger: Integer

    @required
    requiredBoolean: Boolean

    @required
    requiredList: StringList

    @required
    requiredMap: StringMap

    @required
    @default("default")
    requiredStringWithDefault: String

    @required
    @default(0)
    requiredIntegerWithDefault: Integer

    @required
    @default(false)
    requiredBooleanWithDefault: Boolean

    @required
    @default([])
    requiredListWithDefault: StringList

    @required
    @default({})
    requiredMapWithDefault: StringMap
}

operation NullSparseMembers {
    input: NullSparseMembersInput
    output: NullSparseMembersOutput
}

structure NullSparseMembersInput {
    sparseStringList: SparseStringList
    sparseStringMap: SparseStringMap
    sparseStructList: SparseSimpleStructList
    sparseStructMap: SparseSimpleStructMap
}

structure NullSparseMembersOutput {
    sparseStringList: SparseStringList
    sparseStringMap: SparseStringMap
    sparseStructList: SparseSimpleStructList
    sparseStructMap: SparseSimpleStructMap
}

operation ClientOptionalDefaults {
    input: ClientOptionalDefaultsInput
    output: ClientOptionalDefaultsOutput
}

structure ClientOptionalDefaultsInput with [ClientOptionalMixin] {}

structure ClientOptionalDefaultsOutput with [ClientOptionalMixin] {}

@mixin
structure ClientOptionalMixin {
    @clientOptional
    @default(0)
    optionalInteger: Integer

    @clientOptional
    @default("")
    optionalString: String

    @clientOptional
    @default(false)
    optionalBoolean: Boolean
}
