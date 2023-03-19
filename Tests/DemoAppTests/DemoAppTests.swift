// Copyright 2023 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
#if !SKIP
@testable import DemoApp
#endif
import XCTest
import DemoLib
import SkipFoundation
import SkipUI


final class DemoAppTests: XCTestCase {
    // SKIP INSERT: @Test
    func testDemoApp() throws {
        XCTAssertEqual(3, 1 + 2 + 0)
//        XCTAssertEqual("DemoApp", DemoAppInternalModuleName())
//        XCTAssertEqual("DemoApp", DemoAppPublicModuleName())
        XCTAssertEqual("DemoLib", DemoLibPublicModuleName())
        XCTAssertEqual("SkipFoundation", SkipFoundationPublicModuleName())
        XCTAssertEqual("SkipUI", SkipUIPublicModuleName())
    }
}
