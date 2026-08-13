$version: "2.0"

namespace aws.protocoltests.corpus

use aws.protocols#awsJson1_0
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

// =============================================================================
// NoProtocolTraitsBehavior — no @jsonName / @xmlName / @ec2QueryName anywhere,
// and no @timestampFormat.
//
// These operations are the control group for the corpus's wire-name-trait
// design bet: every other layer annotates every member, so a protocol that
// ignored the member name entirely and only ever read @jsonName would still
// pass. Here the traits are absent, so the wire key MUST fall back to the
// plain member name, and timestamps MUST fall back to the protocol default
// format (epoch-seconds for awsJson).
//
// Note that awsJson ignores @jsonName, so these bodies are byte-identical in
// shape to their annotated Core-layer counterparts. That is the point: for
// awsJson specifically, the annotated and unannotated operations must agree.
//
// bigIntegerMember / bigDecimalMember are deliberately left unset per base
// case rule 1.1 (capability-gated types stay out of the baseline and get
// their own `arbitrary-precision`-tagged case).
// =============================================================================
apply NoTraitScalarMembers @httpRequestTests([
    {
        id: "AwsJson10NoTraitScalarMembersSerialize"
        documentation: """
            Serializes scalar members using plain member names as wire keys and
            the protocol default timestamp format, with no naming or format
            traits present on any member"""
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "booleanMember": true,
                "byteMember": 7,
                "shortMember": 300,
                "integerMember": 70000,
                "longMember": 9000000000,
                "floatMember": 3.25,
                "doubleMember": 6.125,
                "stringMember": "noTraits",
                "blobMember": "YmFy",
                "timestampMember": 1609502096,
                "enumMember": "Bar",
                "intEnumMember": 2
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitScalarMembers" }
        params: {
            booleanMember: true
            byteMember: 7
            shortMember: 300
            integerMember: 70000
            longMember: 9000000000
            floatMember: 3.25
            doubleMember: 6.125
            stringMember: "noTraits"
            blobMember: "bar"
            timestampMember: 1609502096
            enumMember: "Bar"
            intEnumMember: 2
        }
    }
])

apply NoTraitScalarMembers @httpResponseTests([
    {
        id: "AwsJson10NoTraitScalarMembersDeserialize"
        documentation: """
            Deserializes scalar members keyed by plain member name, parsing the
            timestamp with the protocol default format"""
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "booleanMember": true,
                "byteMember": 7,
                "shortMember": 300,
                "integerMember": 70000,
                "longMember": 9000000000,
                "floatMember": 3.25,
                "doubleMember": 6.125,
                "stringMember": "noTraits",
                "blobMember": "YmFy",
                "timestampMember": 1609502096,
                "enumMember": "Bar",
                "intEnumMember": 2
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            booleanMember: true
            byteMember: 7
            shortMember: 300
            integerMember: 70000
            longMember: 9000000000
            floatMember: 3.25
            doubleMember: 6.125
            stringMember: "noTraits"
            blobMember: "bar"
            timestampMember: 1609502096
            enumMember: "Bar"
            intEnumMember: 2
        }
    }
])

// =============================================================================
// NoTraitStructOfScalars — struct -> struct with no traits at either level
// =============================================================================
apply NoTraitStructOfScalars @httpRequestTests([
    {
        id: "AwsJson10NoTraitStructOfScalarsSerialize"
        documentation: "Serializes a nested structure whose members carry no naming traits"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "nested": {
                    "stringMember": "nestedNoTraits",
                    "integerMember": 91,
                    "booleanMember": true,
                    "timestampMember": 1609588496
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitStructOfScalars" }
        params: {
            nested: { stringMember: "nestedNoTraits", integerMember: 91, booleanMember: true, timestampMember: 1609588496 }
        }
    }
])

apply NoTraitStructOfScalars @httpResponseTests([
    {
        id: "AwsJson10NoTraitStructOfScalarsDeserialize"
        documentation: "Deserializes a nested structure whose members carry no naming traits"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "nested": {
                    "stringMember": "nestedNoTraits",
                    "integerMember": 91,
                    "booleanMember": true,
                    "timestampMember": 1609588496
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            nested: { stringMember: "nestedNoTraits", integerMember: 91, booleanMember: true, timestampMember: 1609588496 }
        }
    }
])

// =============================================================================
// NoTraitListOfScalars — list members with no traits
// =============================================================================
apply NoTraitListOfScalars @httpRequestTests([
    {
        id: "AwsJson10NoTraitListOfScalarsSerialize"
        documentation: "Serializes lists keyed by plain member name, timestamps in the default format"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "strings": ["alpha", "beta"],
                "integers": [11, 22],
                "timestamps": [1609502096, 1609588496]
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitListOfScalars" }
        params: {
            strings: ["alpha", "beta"]
            integers: [11, 22]
            timestamps: [1609502096, 1609588496]
        }
    }
])

apply NoTraitListOfScalars @httpResponseTests([
    {
        id: "AwsJson10NoTraitListOfScalarsDeserialize"
        documentation: "Deserializes lists keyed by plain member name, timestamps in the default format"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "strings": ["alpha", "beta"],
                "integers": [11, 22],
                "timestamps": [1609502096, 1609588496]
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            strings: ["alpha", "beta"]
            integers: [11, 22]
            timestamps: [1609502096, 1609588496]
        }
    }
])

// =============================================================================
// NoTraitMapOfScalars — map members with no traits
// =============================================================================
apply NoTraitMapOfScalars @httpRequestTests([
    {
        id: "AwsJson10NoTraitMapOfScalarsSerialize"
        documentation: "Serializes maps keyed by plain member name, timestamps in the default format"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "strings": {
                    "stringKeyOne": "gamma",
                    "stringKeyTwo": "delta"
                },
                "integers": {
                    "integerKeyOne": 33,
                    "integerKeyTwo": 44
                },
                "timestamps": {
                    "timestampKeyOne": 1609674896,
                    "timestampKeyTwo": 1609761296
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitMapOfScalars" }
        params: {
            strings: { stringKeyOne: "gamma", stringKeyTwo: "delta" }
            integers: { integerKeyOne: 33, integerKeyTwo: 44 }
            timestamps: { timestampKeyOne: 1609674896, timestampKeyTwo: 1609761296 }
        }
    }
])

apply NoTraitMapOfScalars @httpResponseTests([
    {
        id: "AwsJson10NoTraitMapOfScalarsDeserialize"
        documentation: "Deserializes maps keyed by plain member name, timestamps in the default format"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "strings": {
                    "stringKeyOne": "gamma",
                    "stringKeyTwo": "delta"
                },
                "integers": {
                    "integerKeyOne": 33,
                    "integerKeyTwo": 44
                },
                "timestamps": {
                    "timestampKeyOne": 1609674896,
                    "timestampKeyTwo": 1609761296
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            strings: { stringKeyOne: "gamma", stringKeyTwo: "delta" }
            integers: { integerKeyOne: 33, integerKeyTwo: 44 }
            timestamps: { timestampKeyOne: 1609674896, timestampKeyTwo: 1609761296 }
        }
    }
])

// =============================================================================
// NoTraitUnionMembers — union variant name resolution with no traits.
//
// One case per variant, in both directions, per base case rule 2: a union can
// only carry one variant at a time, so exhaustive coverage has to come from
// separate cases rather than a single fully-populated one.
// =============================================================================
apply NoTraitUnionMembers @httpRequestTests([
    {
        id: "AwsJson10NoTraitUnionStringSerialize"
        documentation: "Serializes the string variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "value": {
                    "stringMember": "unionString"
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitUnionMembers" }
        params: {
            value: { stringMember: "unionString" }
        }
    }
    {
        id: "AwsJson10NoTraitUnionIntegerSerialize"
        documentation: "Serializes the integer variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "value": {
                    "integerMember": 55
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitUnionMembers" }
        params: {
            value: { integerMember: 55 }
        }
    }
    {
        id: "AwsJson10NoTraitUnionBooleanSerialize"
        documentation: "Serializes the boolean variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "value": {
                    "booleanMember": true
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitUnionMembers" }
        params: {
            value: { booleanMember: true }
        }
    }
    {
        id: "AwsJson10NoTraitUnionListSerialize"
        documentation: "Serializes the list variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "value": {
                    "listMember": ["epsilon", "zeta"]
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitUnionMembers" }
        params: {
            value: {
                listMember: ["epsilon", "zeta"]
            }
        }
    }
    {
        id: "AwsJson10NoTraitUnionMapSerialize"
        documentation: "Serializes the map variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "value": {
                    "mapMember": {
                        "mapKeyOne": "eta",
                        "mapKeyTwo": "theta"
                    }
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitUnionMembers" }
        params: {
            value: {
                mapMember: { mapKeyOne: "eta", mapKeyTwo: "theta" }
            }
        }
    }
    {
        id: "AwsJson10NoTraitUnionStructSerialize"
        documentation: "Serializes the structure variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        method: "POST"
        uri: "/"
        body: """
            {
                "value": {
                    "structMember": {
                        "stringMember": "unionNested",
                        "integerMember": 63,
                        "booleanMember": true,
                        "timestampMember": 1609674896
                    }
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0", "X-Amz-Target": "AwsJson10CorpusTests.NoTraitUnionMembers" }
        params: {
            value: {
                structMember: { stringMember: "unionNested", integerMember: 63, booleanMember: true, timestampMember: 1609674896 }
            }
        }
    }
])

apply NoTraitUnionMembers @httpResponseTests([
    {
        id: "AwsJson10NoTraitUnionStringDeserialize"
        documentation: "Deserializes the string variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "value": {
                    "stringMember": "unionString"
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            value: { stringMember: "unionString" }
        }
    }
    {
        id: "AwsJson10NoTraitUnionIntegerDeserialize"
        documentation: "Deserializes the integer variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "value": {
                    "integerMember": 55
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            value: { integerMember: 55 }
        }
    }
    {
        id: "AwsJson10NoTraitUnionBooleanDeserialize"
        documentation: "Deserializes the boolean variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "value": {
                    "booleanMember": true
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            value: { booleanMember: true }
        }
    }
    {
        id: "AwsJson10NoTraitUnionListDeserialize"
        documentation: "Deserializes the list variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "value": {
                    "listMember": ["epsilon", "zeta"]
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            value: {
                listMember: ["epsilon", "zeta"]
            }
        }
    }
    {
        id: "AwsJson10NoTraitUnionMapDeserialize"
        documentation: "Deserializes the map variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "value": {
                    "mapMember": {
                        "mapKeyOne": "eta",
                        "mapKeyTwo": "theta"
                    }
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            value: {
                mapMember: { mapKeyOne: "eta", mapKeyTwo: "theta" }
            }
        }
    }
    {
        id: "AwsJson10NoTraitUnionStructDeserialize"
        documentation: "Deserializes the structure variant of a union whose members carry no naming traits"
        protocol: awsJson1_0
        code: 200
        body: """
            {
                "value": {
                    "structMember": {
                        "stringMember": "unionNested",
                        "integerMember": 63,
                        "booleanMember": true,
                        "timestampMember": 1609674896
                    }
                }
            }"""
        bodyMediaType: "application/json"
        headers: { "Content-Type": "application/x-amz-json-1.0" }
        params: {
            value: {
                structMember: { stringMember: "unionNested", integerMember: 63, booleanMember: true, timestampMember: 1609674896 }
            }
        }
    }
])
