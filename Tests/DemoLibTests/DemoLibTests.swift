// Copyright 2023 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import Foundation
import XCTest
@testable import DemoLib

final class DemoLibTests: XCTestCase {
    func testDemoLib() throws {
        print("running testDemoLib test")
        
        XCTAssertEqual(3.0 + 1.5, 9.0/2)
        XCTAssertEqual("DemoLib", DemoLibInternalModuleName())
        XCTAssertEqual("DemoLib", DemoLibPublicModuleName())

        // test test failure parsing and line number linking
        XCTAssertEqual("DemoLib", DemoLibInternalModuleName())

        //XCTAssertEqual("SkipFoundation", SkipFoundationPublicModuleName())
    }

    func testThrow1MillionErrors() throws {
//        struct SomeError : Error {
//        }
//        for _ in 1...1_000_000 {
//            do {
//                throw SomeError()
//            } catch {
//                // ignore
//            }
//        }
    }


    func testInternalStructs() throws {
        // by default the classes will be generated as "internal class", which is invalid within a function

        // SKIP REPLACE: class Foo { var bar = 2 }
        struct Foo { var bar = 2 }

        XCTAssertEqual(2, Foo().bar)
    }


    func testEnumsAssociatedCases() throws {
        //XCTAssertTrue(JSONType.nullX is JSONType)

        //let nullXValue: JSONType = .nullX // DemoLibTests.kt:53:45 Classifier 'nullX' does not have a companion object, and thus must be initialized here
        //XCTAssertNotNil(nullXValue)

        let booleanValue: JSONType = .boolean(true)
        XCTAssertNotNil(booleanValue)

        let stringValue: JSONType = .string("ABC")
        XCTAssertNotNil(stringValue)

        let numberValue: JSONType = .number(123.456)
        XCTAssertNotNil(numberValue)

        let objectXValue: JSONType = .objectX(["key": JSONType.number(123.456)])
        XCTAssertNotNil(objectXValue)

        let arrayValue: JSONType = .array([JSONType.string("ABC"), JSONType.boolean(false)])
        XCTAssertNotNil(arrayValue)
    }

    enum JSONType {
        //case null // DemoLibTests.kt:58:11 Name expected
        case nullX
        case boolean(Bool)
        case string(String)
        case number(Double)
        //case object([String: JSONType]) // ERROR: DemoLibTests.kt:67:17 Constructors are not allowed for objects
        case objectX([String: JSONType]) // ERROR: DemoLibTests.kt:67:17 Constructors are not allowed for objects
        case array([JSONType])
    }

}
