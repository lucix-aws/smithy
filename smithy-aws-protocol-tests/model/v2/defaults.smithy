$version: "2.0"

namespace aws.protocoltests.corpus

/// Default value, required member, and null handling semantics. These test
/// whether a serializer correctly omits/populates members based on @default,
/// @required, @clientOptional, and sparse collection traits.
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

// =============================================================================
// Default scalars — all scalar types with @default
// =============================================================================
operation DefaultScalars {
    input := with [DefaultScalarsMixin] {}
    output := with [DefaultScalarsMixin] {}
}

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

    // Zero-value members (explicitly set to the zero/default value)
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

// =============================================================================
// Default collections
// =============================================================================
operation DefaultCollections {
    input := with [DefaultCollectionsMixin] {}
    output := with [DefaultCollectionsMixin] {}
}

@mixin
structure DefaultCollectionsMixin {
    @default([])
    defaultList: StringList

    @default({})
    defaultMap: StringMap
}

// =============================================================================
// Nested defaults — defaults inside structs within collections
// =============================================================================
operation NestedDefaults {
    input := {
        topLevel: TopLevelWithDefaults
    }
    output := {
        topLevel: TopLevelWithDefaults
    }
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

// =============================================================================
// Required members — server omits required fields, client must error-correct
// =============================================================================
operation RequiredMembers {
    input := with [RequiredMembersMixin] {}
    output := with [RequiredMembersMixin] {}
}

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

    // Required with defaults — client fills default when server omits
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

// =============================================================================
// Null handling in sparse collections
// =============================================================================
operation NullSparseMembers {
    input := {
        sparseStringList: SparseStringList
        sparseStringMap: SparseStringMap
        sparseStructList: SparseSimpleStructList
        sparseStructMap: SparseSimpleStructMap
    }
    output := {
        sparseStringList: SparseStringList
        sparseStringMap: SparseStringMap
        sparseStructList: SparseSimpleStructList
        sparseStructMap: SparseSimpleStructMap
    }
}

// =============================================================================
// clientOptional — suppresses default population on client
// =============================================================================
operation ClientOptionalDefaults {
    input := with [ClientOptionalMixin] {}
    output := with [ClientOptionalMixin] {}
}

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
