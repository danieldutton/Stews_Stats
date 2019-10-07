//
//  FooTest.swift
//  Stew's StatsTests
//
//  Created by Daniel Dutton on 06/10/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import XCTest
@testable import Stew_s_Stats



class FooTest: XCTestCase {

    func test_sectionArrayHolds_twoSections() {
        let sut = SectionTool()
        let result = sut.getTwoSectionsDescByYear()
        
        let expected = 2
        let actual = result.count
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_twoSectionsHeld_sortedYearDesc() {
        let sut = SectionTool()
        let result = sut.getTwoSectionsDescByYear()
        
        XCTAssertGreaterThan(result[0], result[1])
    }
}
