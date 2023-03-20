// Copyright 2023 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import Foundation
import XCTest
@testable import DemoLib

final class DemoLibTests: XCTestCase {
    // SKIP INSERT: @Test
    func testDemoLib() throws {
        print("running testDemoLib test")
        
        XCTAssertEqual(3.0 + 1.5, 9.0/2)
        XCTAssertEqual("DemoLib", DemoLibInternalModuleName())
        XCTAssertEqual("DemoLib", DemoLibPublicModuleName())
        //XCTAssertEqual("SkipFoundation", SkipFoundationPublicModuleName())

        for _ in 1...1_000_000 {
            do {
                throw SomeError()
            } catch {
                // ignore
            }
        }
    }
}

struct SomeError : Error {
}
