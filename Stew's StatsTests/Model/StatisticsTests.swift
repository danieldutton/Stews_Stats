import XCTest

class StatisticsTests: XCTestCase {

    //MARK: SUBSCRIPT-GET
    
    //MARK: HAPPY PATH - SUBSCRIPT-GET
    
    func test_subscriptGet_requestFirstRowInSectionOne_correctRowReturned() {
        let sut: Statistics = makeStatistics

        let expected = TableViewRow(stat1: "sec1-row1-stat1", stat2: "sec1-row1-stat2")
        let actual: TableViewRow = sut[IndexPath(row: 0, section: 0)]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptGet_requestLastRowInSectionOne_correctRowReturned() {
        let sut: Statistics = makeStatistics

        let expected = TableViewRow(stat1: "sec1-row2-stat1", stat2: "sec1-row2-stat2")
        let actual: TableViewRow = sut[IndexPath(row: 1, section: 0)]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptGet_requestFirstRowInSectionTwo_correctRowReturned() {
        let sut: Statistics = makeStatistics
        
        let expected = TableViewRow(stat1: "sec2-row1-stat1", stat2: "sec2-row1-stat2")
        let actual: TableViewRow = sut[IndexPath(row: 0, section: 1)]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptGet_requestThirdRowInSectionTwo_correctRowReturned() {
        let sut: Statistics = makeStatistics
        
        let expected = TableViewRow(stat1: "sec2-row3-stat1", stat2: "sec2-row3-stat2")
        let actual: TableViewRow = sut[IndexPath(row: 2, section: 1)]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptGet_requestLastRowInSectionTwo_correctRowReturned() {
        let sut: Statistics = makeStatistics
        
        let expected = TableViewRow(stat1: "sec2-row5-stat1", stat2: "sec2-row5-stat2")
        let actual: TableViewRow = sut[IndexPath(row: 4, section: 1)]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptGet_requestOnlyRowInSectionThree_correctRowReturned() {
        let sut: Statistics = makeStatistics
        
        let expected = TableViewRow(stat1: "sec3-row1-stat1", stat2: "sec3-row1-stat2")
        let actual: TableViewRow = sut[IndexPath(row: 0, section: 2)]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    //MARK: SAD PATH - SUBSCRIPT-GET
    
    func test_subscriptGet_requestRowInStatisticsWithNoSections_nilReturned() {
        let sut: Statistics = makeEmptyStatistics

        let actual: TableViewRow? = sut[IndexPath(row: 0, section: 0)]
        
        XCTAssertNil(actual)
    }
    
    func test_subscriptGet_requestLowerOutOfBoundsSectionFromStatistics_nilReturned() {
        let sut: Statistics = makeStatistics

        let actual: TableViewRow? = sut[IndexPath(row: 0, section: -1)]
        
        XCTAssertNil(actual)
    }
    
    func test_subscriptGet_requestUpperOutOfBoundsSectionFromStatistics_nilReturned() {
        let sut: Statistics = makeStatistics

        //this has no rows so is coming up nil on the subsequent row check
        let actual: TableViewRow? = sut[IndexPath(row: 0, section: 4)]
        
        XCTAssertNil(actual)
    }
    
    func test_subscriptGet_requestLowerOutOfBoundsRowFromStatisticsSection_nilReturned() {
        let sut: Statistics = makeStatistics

        let actual: TableViewRow? = sut[IndexPath(row: -1, section: 1)]
        
        XCTAssertNil(actual)
    }
    
    func test_subscriptGet_requestUpperOutOfBoundsSectionFromStatisticsSection_nilReturned() {
        let sut: Statistics = makeStatistics

        //this has no rows so is coming up nil on the subsequent row check
        let actual: TableViewRow? = sut[IndexPath(row: 5, section: 1)]
        
        XCTAssertNil(actual)
    }

    //MARK: SUBSCRIPT-SET
    
    //MARK: HAPPY PATH - SUBSCRIPT-SET
    
    func test_subscriptSet_setFirstRowInSectionOne_rowUpdatedCorrectly() {
        var sut: Statistics = makeStatistics
        let newRow = TableViewRow(stat1: "TableViewRow Update 1", stat2: "TableViewRow Update 1")
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut[indexPath] = newRow
        
        let expected = newRow
        let actual: TableViewRow = sut[indexPath]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptSet_setLastRowInSectionOne_rowUpdatedCorrectly() {
        var sut: Statistics = makeStatistics
        let newRow = TableViewRow(stat1: "TableViewRow Update 2", stat2: "TableViewRow Update 2")
        let indexPath = IndexPath(row: 1, section: 0)
        
        sut[indexPath] = newRow
        
        let expected = newRow
        let actual: TableViewRow = sut[indexPath]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptSet_setFirstRowInSectionTwo_rowUpdatedCorrectly() {
        var sut: Statistics = makeStatistics
        let newRow = TableViewRow(stat1: "TableViewRow Update 3", stat2: "TableViewRow Update 3")
        let indexPath = IndexPath(row: 0, section: 1)
        
        sut[indexPath] = newRow
        
        let expected = newRow
        let actual: TableViewRow = sut[indexPath]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptSet_setThirdRowInSectionTwo_rowUpdatedCorrectly() {
        var sut: Statistics = makeStatistics
        let newRow = TableViewRow(stat1: "TableViewRow Update 4", stat2: "TableViewRow Update 4")
        let indexPath = IndexPath(row: 2, section: 1)
        
        sut[indexPath] = newRow
        
        let expected = newRow
        let actual: TableViewRow = sut[indexPath]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptSet_setLastRowInSectionTwo_rowUpdatedCorrectly() {
        var sut: Statistics = makeStatistics
        let newRow = TableViewRow(stat1: "TableViewRow Update 5", stat2: "TableViewRow Update 5")
        let indexPath = IndexPath(row: 4, section: 1)
        
        sut[indexPath] = newRow
        
        let expected = newRow
        let actual: TableViewRow = sut[indexPath]!
        
        //XCTAssertEqual(expected, actual)
    }

    func test_subscriptSet_setOnlyRowInSectionThree_rowUpdatedCorrectly() {
        var sut: Statistics = makeStatistics
        let newRow = TableViewRow(stat1: "TableViewRow Update 6", stat2: "TableViewRow Update 6")
        let indexPath = IndexPath(row: 0, section: 2)
        
        sut[indexPath] = newRow
        
        let expected = newRow
        let actual: TableViewRow = sut[indexPath]!
        
        //XCTAssertEqual(expected, actual)
    }
    
    func test_subscriptSet_updateAnyRow_rowCountInSectionRemainsTheSame() {
        var sut: Statistics = makeStatistics
        let newRow = TableViewRow(stat1: "", stat2: "")
        let indexPath = IndexPath(row: 2, section: 1)
        
        sut[indexPath] = newRow
        
        let expected = 5
        let actual = sut.sections[1].rows.count
        
        XCTAssertEqual(expected, actual)
    }
    
    //MARK: SAD PATH - SUBSCRIPT-SET
    
    func test_subscriptSet_tryToSetNilRow_nothingIsSet() {
        
    }
    
    func test_subscriptSet_SetRowInStatisticsWithNoSections_nothingIsSet() {
        
    }
    
    func test_subscriptSet_setLowerOutOfBoundsRowInStatistics_nothingIsSet() {
        
    }
    
    
}

extension StatisticsTests {
    //
    var makeStatistics: Statistics {
        let section1Rows = [
            TableViewRow(stat1: "sec1-row1-stat1", stat2: "sec1-row1-stat2"),
            TableViewRow(stat1: "sec1-row2-stat1", stat2: "sec1-row2-stat2"),
        ]
        
        let section2Rows = [
            TableViewRow(stat1: "sec2-row1-stat1", stat2: "sec2-row1-stat2"),
            TableViewRow(stat1: "sec2-row2-stat1", stat2: "sec2-row2-stat2"),
            TableViewRow(stat1: "sec2-row3-stat1", stat2: "sec2-row3-stat2"),
            TableViewRow(stat1: "sec2-row4-stat1", stat2: "sec2-row4-stat2"),
            TableViewRow(stat1: "sec2-row5-stat1", stat2: "sec2-row5-stat2"),
        ]
        
        let section3Rows = [
            TableViewRow(stat1: "sec3-row1-stat1", stat2: "sec3-row1-stat2"),
        ]
        
        let section4Rows: [TableViewRow] = [
        ]
        
        let sections = [
            TableViewSection(name: "TableViewSection 1", rows: section1Rows),
            TableViewSection(name: "TableViewSection 2", rows: section2Rows),
            TableViewSection(name: "TableViewSection 3", rows: section3Rows),
            TableViewSection(name: "TableViewSection 4", rows: section4Rows),
        ]
        return Statistics(saveKey: .daily, sections: sections)
    }
    
    var makeEmptyStatistics: Statistics {
        return Statistics(saveKey: .daily, sections: [])
    }
}
