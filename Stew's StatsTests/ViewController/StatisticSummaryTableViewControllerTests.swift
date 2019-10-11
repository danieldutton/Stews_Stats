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
    
    //use mock test data?
    
    func test_onInit_tableViewIsNotNil() {
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
        
        let delegate = sut.tableView.delegate as! DailyActivityStatisticsController
        let dataSource = sut.tableView.dataSource as! DailyActivityStatisticsController
        
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
    
    // MARK: Section 1 Cell Row Tests
    
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

    func test_willSelectRowAt_returnsNil() {
        let sut = createTableViewController()
        let tableView = UITableView()

    }
    
    // MARK: Section 1 Cell Row Tests
    
    func test_section1_Row1_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! DailyActivityStatisticsCell
        
        let expected = "1-5 miles"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }

    func test_section1_Row2_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! DailyActivityStatisticsCell
        
        let expected = "5-10 miles"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section1_Row3_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as! DailyActivityStatisticsCell
        
        let expected = "10-15 miles"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section1_Row4_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 3, section: 0)) as! DailyActivityStatisticsCell
        
        let expected = "15-20 miles"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section1_Row5_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 4, section: 0)) as! DailyActivityStatisticsCell
        
        let expected = "20-30 miles"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    // MARK: Section 2 Cell Row Tests
    
    func test_section2_Row1_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 1)) as! DailyActivityStatisticsCell
        
        let expected = "< 30 mins"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }

    func test_section2_Row2_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 1)) as! DailyActivityStatisticsCell
        
        let expected = "30-60 mins"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section2_Row3_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 1)) as! DailyActivityStatisticsCell
        
        let expected = "1-2 hours"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section2_Row4_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 3, section: 1)) as! DailyActivityStatisticsCell
        
        let expected = "2-3 hours"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section2_Row5_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 4, section: 1)) as! DailyActivityStatisticsCell
        
        let expected = "3-5 hours"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    // MARK: Section 3 Cell Row Tests
    
    func test_section3_Row1_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 2)) as! DailyActivityStatisticsCell
        
        let expected = "Road"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }

    func test_section3_Row2_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 2)) as! DailyActivityStatisticsCell
        
        let expected = "Mixed"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section3_Row3_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 2)) as! DailyActivityStatisticsCell
        
        let expected = "Trail"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section3_Row4_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 3, section: 2)) as! DailyActivityStatisticsCell
        
        let expected = "Beach"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section3_Row5_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 4, section: 2)) as! DailyActivityStatisticsCell
        
        let expected = "Wilderness"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    // MARK: Section 4 Cell Row Tests
    
    func test_section4_Row1_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 3)) as! DailyActivityStatisticsCell
        
        let expected = "Sunny"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }

    func test_section4_Row2_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 3)) as! DailyActivityStatisticsCell
        
        let expected = "Cloudy"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section4_Row3_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 3)) as! DailyActivityStatisticsCell
        
        let expected = "Rainy"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section4_Row4_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 3, section: 3)) as! DailyActivityStatisticsCell
        
        let expected = "Snowy"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section4_Row5_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 4, section: 3)) as! DailyActivityStatisticsCell
        
        let expected = "Night"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    // MARK: Section 5 Cell Row Tests
    
    func test_section5_Row1_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 4)) as! DailyActivityStatisticsCell
        
        let expected = "Awesome"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }

    func test_section5_Row2_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 4)) as! DailyActivityStatisticsCell
        
        let expected = "Good"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section5_Row3_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 4)) as! DailyActivityStatisticsCell
        
        let expected = "So-So"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section5_Row4_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 3, section: 4)) as! DailyActivityStatisticsCell
        
        let expected = "Sluggish"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_section5_Row5_labelValueIsCorrect() {
        let sut = createTableViewController()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 4, section: 4)) as! DailyActivityStatisticsCell
        
        let expected = "Injured"
        let actual = cell.lblStat.text!
        
        XCTAssertEqual(expected, actual)
    }
}

extension StatisticSummaryTableViewControllerTests {
    
    // MARK: Helper Methods
    fileprivate func createTableViewController() -> DailyActivityStatisticsController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "Main") as! DailyActivityStatisticsController
        _ = sut.view
        
        return sut
    }
}
