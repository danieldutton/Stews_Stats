//
//  StatisticSummaryTableViewControllerTests.swift
//  Stew's StatsTests
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import XCTest
import UIKit
@testable import Stew_s_Stats

class StatisticSummaryTableViewControllerTests: XCTestCase {
    
    func test_onInit_tableViewShouldNotBeNil() {
        let sut = createTableViewController()
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_onInit_dataSource() {
        let sut = createTableViewController()
        
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is StatisticSummaryTableVC)
    }
    
    func test_delegate() {
        let sut = createTableViewController()
        
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is StatisticSummaryTableVC)
    }
    
    func test_setsTableViewDelegateAndDataSourceToSameObject() {
        let sut = createTableViewController()
        
        let delegate = sut.tableView.delegate as! StatisticSummaryTableVC
        let dataSource = sut.tableView.dataSource as! StatisticSummaryTableVC
        
        XCTAssertEqual(delegate, dataSource)
    }
    
    func test_tableViewSectionCount_ShouldBeSix() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = 6
        let actual = sut.numberOfSections(in: tableView)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_tableViewSectionCount_rowCountInSectionOne_equalsXCount() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = 5
        let actual = sut.tableView(tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_tableViewSectionCount_rowCountInSectionTwo_equalsXCount() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = 5
        let actual = sut.tableView(tableView, numberOfRowsInSection: 1)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_tableViewSectionCount_rowCountInSectionThree_equalsXCount() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = 5
        let actual = sut.tableView(tableView, numberOfRowsInSection: 2)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_tableViewSectionCount_rowCountInSectionFour_equalsXCount() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = 5
        let actual = sut.tableView(tableView, numberOfRowsInSection: 3)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_tableViewSectionCount_rowCountInSectionFive_equalsXCount() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = 5
        let actual = sut.tableView(tableView, numberOfRowsInSection: 4)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_tableViewSectionCount_rowCountInSectionSix_equalsXCount() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = 39
        let actual = sut.tableView(tableView, numberOfRowsInSection: 5)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_titleForSectionZeroCorrect() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = "Distance"
        let actual = sut.tableView(tableView, titleForHeaderInSection: 0)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_titleForSectionOneCorrect() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = "Duration"
        let actual = sut.tableView(tableView, titleForHeaderInSection: 1)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_titleForSectionTwoCorrect() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = "Surface"
        let actual = sut.tableView(tableView, titleForHeaderInSection: 2)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_titleForSectionThreeCorrect() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = "Weather"
        let actual = sut.tableView(tableView, titleForHeaderInSection: 3)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_titleForSectionFourCorrect() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = "Mood"
        let actual = sut.tableView(tableView, titleForHeaderInSection: 4)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_titleForSectionFiveCorrect() {
        let sut = createTableViewController()
        let tableView = UITableView()
        
        let expected = "Location"
        let actual = sut.tableView(tableView, titleForHeaderInSection: 5)!
        
        XCTAssertEqual(expected, actual)
    }
}


extension StatisticSummaryTableViewControllerTests {
    fileprivate func createTableViewController() -> StatisticSummaryTableVC {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "Main") as! StatisticSummaryTableVC
        _ = sut.view
        
        return sut
    }
}
