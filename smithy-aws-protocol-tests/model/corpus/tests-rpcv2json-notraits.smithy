$version: "2.0"

namespace aws.protocoltests.corpus

use smithy.protocols#rpcv2Json
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
// format (epoch-seconds for rpcv2Json).
//
// Note that rpcv2Json ignores @jsonName, so these bodies are byte-identical in
// shape to their annotated Core-layer counterparts. That is the point: for
// rpcv2Json specifically, the annotated and unannotated operations must agree.
//
// bigIntegerMember / bigDecimalMember are deliberately left unset per base
// case rule 1.1 (capability-gated types stay out of the baseline and get
// their own `arbitrary-precision`-tagged case).
// =============================================================================

apply NoTraitScalarMembers @httpRequestTests([
    {
        id: "RpcV2JsonNoTraitScalarMembersSerialize",
        documentation: """
            Serializes scalar members using plain member names as wire keys and
            the protocol default timestamp format, with no naming or format
            traits present on any member""",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitScalarMembers",
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
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            booleanMember: true,
            byteMember: 7,
            shortMember: 300,
            integerMember: 70000,
            longMember: 9000000000,
            floatMember: 3.25,
            doubleMember: 6.125,
            stringMember: "noTraits",
            blobMember: "bar",
            timestampMember: 1609502096,
            enumMember: "Bar",
            intEnumMember: 2,
        }
    },
])

apply NoTraitScalarMembers @httpResponseTests([
    {
        id: "RpcV2JsonNoTraitScalarMembersDeserialize",
        documentation: """
            Deserializes scalar members keyed by plain member name, parsing the
            timestamp with the protocol default format""",
        protocol: rpcv2Json,
        code: 200,
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
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            booleanMember: true,
            byteMember: 7,
            shortMember: 300,
            integerMember: 70000,
            longMember: 9000000000,
            floatMember: 3.25,
            doubleMember: 6.125,
            stringMember: "noTraits",
            blobMember: "bar",
            timestampMember: 1609502096,
            enumMember: "Bar",
            intEnumMember: 2,
        }
    },
])

// =============================================================================
// NoTraitStructOfScalars — struct -> struct with no traits at either level
// =============================================================================

apply NoTraitStructOfScalars @httpRequestTests([
    {
        id: "RpcV2JsonNoTraitStructOfScalarsSerialize",
        documentation: "Serializes a nested structure whose members carry no naming traits",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitStructOfScalars",
        body: """
            {
                "nested": {
                    "stringMember": "nestedNoTraits",
                    "integerMember": 91,
                    "booleanMember": true,
                    "timestampMember": 1609588496
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            nested: {
                stringMember: "nestedNoTraits",
                integerMember: 91,
                booleanMember: true,
                timestampMember: 1609588496,
            },
        }
    },
])

apply NoTraitStructOfScalars @httpResponseTests([
    {
        id: "RpcV2JsonNoTraitStructOfScalarsDeserialize",
        documentation: "Deserializes a nested structure whose members carry no naming traits",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "nested": {
                    "stringMember": "nestedNoTraits",
                    "integerMember": 91,
                    "booleanMember": true,
                    "timestampMember": 1609588496
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            nested: {
                stringMember: "nestedNoTraits",
                integerMember: 91,
                booleanMember: true,
                timestampMember: 1609588496,
            },
        }
    },
])

// =============================================================================
// NoTraitListOfScalars — list members with no traits
// =============================================================================

apply NoTraitListOfScalars @httpRequestTests([
    {
        id: "RpcV2JsonNoTraitListOfScalarsSerialize",
        documentation: "Serializes lists keyed by plain member name, timestamps in the default format",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitListOfScalars",
        body: """
            {
                "strings": ["alpha", "beta"],
                "integers": [11, 22],
                "timestamps": [1609502096, 1609588496]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            strings: ["alpha", "beta"],
            integers: [11, 22],
            timestamps: [1609502096, 1609588496],
        }
    },
])

apply NoTraitListOfScalars @httpResponseTests([
    {
        id: "RpcV2JsonNoTraitListOfScalarsDeserialize",
        documentation: "Deserializes lists keyed by plain member name, timestamps in the default format",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "strings": ["alpha", "beta"],
                "integers": [11, 22],
                "timestamps": [1609502096, 1609588496]
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            strings: ["alpha", "beta"],
            integers: [11, 22],
            timestamps: [1609502096, 1609588496],
        }
    },
])

// =============================================================================
// NoTraitMapOfScalars — map members with no traits
// =============================================================================

apply NoTraitMapOfScalars @httpRequestTests([
    {
        id: "RpcV2JsonNoTraitMapOfScalarsSerialize",
        documentation: "Serializes maps keyed by plain member name, timestamps in the default format",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitMapOfScalars",
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
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            strings: {
                stringKeyOne: "gamma",
                stringKeyTwo: "delta",
            },
            integers: {
                integerKeyOne: 33,
                integerKeyTwo: 44,
            },
            timestamps: {
                timestampKeyOne: 1609674896,
                timestampKeyTwo: 1609761296,
            },
        }
    },
])

apply NoTraitMapOfScalars @httpResponseTests([
    {
        id: "RpcV2JsonNoTraitMapOfScalarsDeserialize",
        documentation: "Deserializes maps keyed by plain member name, timestamps in the default format",
        protocol: rpcv2Json,
        code: 200,
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
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            strings: {
                stringKeyOne: "gamma",
                stringKeyTwo: "delta",
            },
            integers: {
                integerKeyOne: 33,
                integerKeyTwo: 44,
            },
            timestamps: {
                timestampKeyOne: 1609674896,
                timestampKeyTwo: 1609761296,
            },
        }
    },
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
        id: "RpcV2JsonNoTraitUnionStringSerialize",
        documentation: "Serializes the string variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitUnionMembers",
        body: """
            {
                "value": {
                    "stringMember": "unionString"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            value: {
                stringMember: "unionString",
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionIntegerSerialize",
        documentation: "Serializes the integer variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitUnionMembers",
        body: """
            {
                "value": {
                    "integerMember": 55
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            value: {
                integerMember: 55,
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionBooleanSerialize",
        documentation: "Serializes the boolean variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitUnionMembers",
        body: """
            {
                "value": {
                    "booleanMember": true
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            value: {
                booleanMember: true,
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionListSerialize",
        documentation: "Serializes the list variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitUnionMembers",
        body: """
            {
                "value": {
                    "listMember": ["epsilon", "zeta"]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            value: {
                listMember: ["epsilon", "zeta"],
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionMapSerialize",
        documentation: "Serializes the map variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitUnionMembers",
        body: """
            {
                "value": {
                    "mapMember": {
                        "mapKeyOne": "eta",
                        "mapKeyTwo": "theta"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            value: {
                mapMember: {
                    mapKeyOne: "eta",
                    mapKeyTwo: "theta",
                },
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionStructSerialize",
        documentation: "Serializes the structure variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        method: "POST",
        uri: "/service/RpcV2JsonCorpusTests/operation/NoTraitUnionMembers",
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
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        requireHeaders: [
            "Content-Length",
        ],
        forbidHeaders: [
            "X-Amz-Target",
        ],
        params: {
            value: {
                structMember: {
                    stringMember: "unionNested",
                    integerMember: 63,
                    booleanMember: true,
                    timestampMember: 1609674896,
                },
            },
        }
    },
])

apply NoTraitUnionMembers @httpResponseTests([
    {
        id: "RpcV2JsonNoTraitUnionStringDeserialize",
        documentation: "Deserializes the string variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "value": {
                    "stringMember": "unionString"
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            value: {
                stringMember: "unionString",
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionIntegerDeserialize",
        documentation: "Deserializes the integer variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "value": {
                    "integerMember": 55
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            value: {
                integerMember: 55,
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionBooleanDeserialize",
        documentation: "Deserializes the boolean variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "value": {
                    "booleanMember": true
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            value: {
                booleanMember: true,
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionListDeserialize",
        documentation: "Deserializes the list variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "value": {
                    "listMember": ["epsilon", "zeta"]
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            value: {
                listMember: ["epsilon", "zeta"],
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionMapDeserialize",
        documentation: "Deserializes the map variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        code: 200,
        body: """
            {
                "value": {
                    "mapMember": {
                        "mapKeyOne": "eta",
                        "mapKeyTwo": "theta"
                    }
                }
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            value: {
                mapMember: {
                    mapKeyOne: "eta",
                    mapKeyTwo: "theta",
                },
            },
        }
    },
    {
        id: "RpcV2JsonNoTraitUnionStructDeserialize",
        documentation: "Deserializes the structure variant of a union whose members carry no naming traits",
        protocol: rpcv2Json,
        code: 200,
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
            }""",
        bodyMediaType: "application/json",
        headers: {
            "smithy-protocol": "rpc-v2-json",
            "Content-Type": "application/json",
        },
        params: {
            value: {
                structMember: {
                    stringMember: "unionNested",
                    integerMember: 63,
                    booleanMember: true,
                    timestampMember: 1609674896,
                },
            },
        }
    },
])
