// Copyright 2023 Skip
//
// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org
import Foundation
import XCTest
@testable import TemplateLib

final class TemplateLibTests: XCTestCase {
    func testTemplateLib() throws {
        print("running testTemplateLib test")
        
        XCTAssertEqual(3.0 + 1.5, 9.0/2)
        XCTAssertEqual("TemplateLib", TemplateLibInternalModuleName())
        XCTAssertEqual("TemplateLib", TemplateLibPublicModuleName())
        XCTAssertEqual("TemplateLib", TemplateLibInternalModuleName())
    }
}
