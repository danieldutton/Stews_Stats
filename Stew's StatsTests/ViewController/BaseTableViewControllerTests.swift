//
//  BaseTableViewControllerTests.swift
//  Stew's StatsTests
//
//  Created by Daniel Dutton on 04/10/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import XCTest
import UIKit
@testable import Stew_s_Stats

class BaseTableViewControllerTests: XCTestCase {

    func test_viewDidLoad_invokingViewDidLoad_addsEditButtonItem() {
        let sut = BaseTableViewController()
        //sut.viewDidLoad()
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func test_numberOfSections_sectionsLeftAsDefault_hasZeroSections() {
        let sut = BaseTableViewController()
        
        let expected = 0
        let actual = sut.numberOfSections(in: UITableView())
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_numberOfSections_sectionsAdded_hasCorrectSectionCount() {
        let sections: [Section] = [
            Section(name: "S1"), Section(name: "S2"), Section(name: "S3")
        ]
        let sut = BaseTableViewController()
        sut.sections = sections
        
        let expected = sections.count
        let actual = sut.numberOfSections(in: UITableView())
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_numberOfRowsInSection_zeroByDefault() {
        let sut = BaseTableViewController()
        
        let expected = 0
        let actual = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        
        XCTAssertEqual(expected, actual)
    }
}
