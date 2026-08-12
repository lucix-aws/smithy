$version: "2.0"

namespace aws.protocoltests.corpus

use smithy.test#httpMalformedRequestTests
use smithy.framework#ValidationException
use aws.protocols#restJson1

apply MalformedRange @httpMalformedRequestTests([
    {
        id: "RestJson1CorpusMalformedRangeByteBelowMin",
        documentation: "Rejects a byte value below the modeled minimum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeByte" : 1 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeByte' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeByte' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeByte"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeByteAboveMax",
        documentation: "Rejects a byte value above the modeled maximum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeByte" : 9 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeByte' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeByte' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeByte"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeShortBelowMin",
        documentation: "Rejects a short value below the modeled minimum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeShort" : 1 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeShort' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeShort' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeShort"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeShortAboveMax",
        documentation: "Rejects a short value above the modeled maximum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeShort" : 9 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeShort' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeShort' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeShort"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeIntegerBelowMin",
        documentation: "Rejects an integer value below the modeled minimum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeInteger" : 1 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeInteger' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeInteger' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeInteger"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeIntegerAboveMax",
        documentation: "Rejects an integer value above the modeled maximum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeInteger" : 9 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeInteger' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeInteger' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeInteger"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeLongBelowMin",
        documentation: "Rejects a long value below the modeled minimum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeLong" : 1 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeLong' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeLong' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeLong"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeLongAboveMax",
        documentation: "Rejects a long value above the modeled maximum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeLong" : 9 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeLong' failed to satisfy constraint: Member must be between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeLong' failed to satisfy constraint: Member must be between 2 and 8, inclusive", "path": "/rangeLong"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeFloatBelowMin",
        documentation: "Rejects a float value below the modeled minimum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeFloat" : 1.0 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeFloat' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeFloat' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive", "path": "/rangeFloat"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeFloatAboveMax",
        documentation: "Rejects a float value above the modeled maximum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeFloat" : 9.0 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeFloat' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeFloat' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive", "path": "/rangeFloat"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeDoubleBelowMin",
        documentation: "Rejects a double value below the modeled minimum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeDouble" : 1.0 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeDouble' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeDouble' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive", "path": "/rangeDouble"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRangeDoubleAboveMax",
        documentation: "Rejects a double value above the modeled maximum.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRange",
            body: """
            { "rangeDouble" : 9.0 }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/rangeDouble' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive",
                      "fieldList" : [{"message": "Value at '/rangeDouble' failed to satisfy constraint: Member must be between 2.0 and 8.0, inclusive", "path": "/rangeDouble"}]}"""
                }
            }
        }
    },
])

apply MalformedLength @httpMalformedRequestTests([
    {
        id: "RestJson1CorpusMalformedLengthStringBelowMin",
        documentation: "Rejects a string shorter than the modeled minimum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthString" : "a" }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 1 at '/lengthString' failed to satisfy constraint: Member must have length between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value with length 1 at '/lengthString' failed to satisfy constraint: Member must have length between 2 and 8, inclusive", "path": "/lengthString"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedLengthStringAboveMax",
        documentation: "Rejects a string longer than the modeled maximum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthString" : "abcdefghi" }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 9 at '/lengthString' failed to satisfy constraint: Member must have length between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value with length 9 at '/lengthString' failed to satisfy constraint: Member must have length between 2 and 8, inclusive", "path": "/lengthString"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedLengthBlobBelowMin",
        documentation: "Rejects a blob shorter than the modeled minimum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthBlob" : "YQ==" }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 1 at '/lengthBlob' failed to satisfy constraint: Member must have length between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value with length 1 at '/lengthBlob' failed to satisfy constraint: Member must have length between 2 and 8, inclusive", "path": "/lengthBlob"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedLengthBlobAboveMax",
        documentation: "Rejects a blob longer than the modeled maximum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthBlob" : "YWJjZGVmZ2hp" }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 9 at '/lengthBlob' failed to satisfy constraint: Member must have length between 2 and 8, inclusive",
                      "fieldList" : [{"message": "Value with length 9 at '/lengthBlob' failed to satisfy constraint: Member must have length between 2 and 8, inclusive", "path": "/lengthBlob"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedLengthListBelowMin",
        documentation: "Rejects a list shorter than the modeled minimum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthList" : ["a"] }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 1 at '/lengthList' failed to satisfy constraint: Member must have length between 2 and 4, inclusive",
                      "fieldList" : [{"message": "Value with length 1 at '/lengthList' failed to satisfy constraint: Member must have length between 2 and 4, inclusive", "path": "/lengthList"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedLengthListAboveMax",
        documentation: "Rejects a list longer than the modeled maximum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthList" : ["a", "b", "c", "d", "e"] }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 5 at '/lengthList' failed to satisfy constraint: Member must have length between 2 and 4, inclusive",
                      "fieldList" : [{"message": "Value with length 5 at '/lengthList' failed to satisfy constraint: Member must have length between 2 and 4, inclusive", "path": "/lengthList"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedLengthMapBelowMin",
        documentation: "Rejects a map with fewer entries than the modeled minimum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthMap" : {"a": "1"} }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 1 at '/lengthMap' failed to satisfy constraint: Member must have length between 2 and 4, inclusive",
                      "fieldList" : [{"message": "Value with length 1 at '/lengthMap' failed to satisfy constraint: Member must have length between 2 and 4, inclusive", "path": "/lengthMap"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedLengthMapAboveMax",
        documentation: "Rejects a map with more entries than the modeled maximum length.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedLength",
            body: """
            { "lengthMap" : {"a": "1", "b": "2", "c": "3", "d": "4", "e": "5"} }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value with length 5 at '/lengthMap' failed to satisfy constraint: Member must have length between 2 and 4, inclusive",
                      "fieldList" : [{"message": "Value with length 5 at '/lengthMap' failed to satisfy constraint: Member must have length between 2 and 4, inclusive", "path": "/lengthMap"}]}"""
                }
            }
        }
    },
])

apply MalformedPattern @httpMalformedRequestTests([
    {
        id: "RestJson1CorpusMalformedPatternString",
        documentation: "Rejects a string that does not match the modeled pattern.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedPattern",
            body: """
            { "patternString" : "xyz" }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/patternString' failed to satisfy constraint: Member must satisfy regular expression pattern: ^[a-m]+$",
                      "fieldList" : [{"message": "Value at '/patternString' failed to satisfy constraint: Member must satisfy regular expression pattern: ^[a-m]+$", "path": "/patternString"}]}"""
                }
            }
        }
    },
])

apply MalformedUniqueItems @httpMalformedRequestTests([
    {
        id: "RestJson1CorpusMalformedUniqueItemsList",
        documentation: "Rejects a list with duplicate items.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedUniqueItems",
            body: """
            { "uniqueItemsList" : ["foo", "bar", "foo"] }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/uniqueItemsList' failed to satisfy constraint: Member must have unique values",
                      "fieldList" : [{"message": "Value at '/uniqueItemsList' failed to satisfy constraint: Member must have unique values", "path": "/uniqueItemsList"}]}"""
                }
            }
        }
    },
])

apply MalformedEnum @httpMalformedRequestTests([
    {
        id: "RestJson1CorpusMalformedEnumUnknownValue",
        documentation: "Rejects an unmodeled enum value.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedEnum",
            body: """
            { "enumValue" : "Unmodeled" }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/enumValue' failed to satisfy constraint: Member must satisfy enum value set: [Foo, Bar, Baz]",
                      "fieldList" : [{"message": "Value at '/enumValue' failed to satisfy constraint: Member must satisfy enum value set: [Foo, Bar, Baz]", "path": "/enumValue"}]}"""
                }
            }
        }
    },
])

apply MalformedRequired @httpMalformedRequestTests([
    {
        id: "RestJson1CorpusMalformedRequiredBodyUnset",
        documentation: "Rejects a request missing all required members.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRequired",
            body: """
            {  }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "2 validation errors detected. Value at '/requiredString' failed to satisfy constraint: Member must not be null; Value at '/requiredInteger' failed to satisfy constraint: Member must not be null",
                      "fieldList" : [{"message": "Value at '/requiredString' failed to satisfy constraint: Member must not be null", "path": "/requiredString"}, {"message": "Value at '/requiredInteger' failed to satisfy constraint: Member must not be null", "path": "/requiredInteger"}]}"""
                }
            }
        }
    },
    {
        id: "RestJson1CorpusMalformedRequiredOneMemberUnset",
        documentation: "Rejects a request missing one of two required members.",
        protocol: restJson1,
        request: {
            method: "POST",
            uri: "/corpus/MalformedRequired",
            body: """
            { "requiredString" : "foo" }""",
            headers: {
                "content-type": "application/json"
            }
        },
        response: {
            code: 400,
            headers: {
                "x-amzn-errortype": "ValidationException"
            },
            body: {
                mediaType: "application/json",
                assertion: {
                    contents: """
                    { "message" : "1 validation error detected. Value at '/requiredInteger' failed to satisfy constraint: Member must not be null",
                      "fieldList" : [{"message": "Value at '/requiredInteger' failed to satisfy constraint: Member must not be null", "path": "/requiredInteger"}]}"""
                }
            }
        }
    },
])

