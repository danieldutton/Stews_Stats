import XCTest

class TableViewCellAnnualStatTests: XCTestCase {
    
    //MARK:- AsRow - GETTER
    
    //Unit Test Complete
    func test_returned_row_values_contain_textFields_text_values() {
        let sut: TableViewCellAnnualStat = makeTableViewCellAnnualStat(txtFieldsText: ("stat 1", "stat 2"))

        let expected = TableViewRow(stat1: "stat 1", stat2: "stat 2")
        let actual: TableViewRow = sut.asRow
        
        assertTableViewRowsAreEqual(expected, actual)
    }
    
    //Unit Test Complete
    func test_returned_row_values_contain_empty_textFields_values() {
        let sut: TableViewCellAnnualStat = makeTableViewCellAnnualStat(txtFieldsText: ("", ""))

        let expected = TableViewRow(stat1: "", stat2: "")
        let actual: TableViewRow = sut.asRow
        
        assertTableViewRowsAreEqual(expected, actual)
    }
    
    //MARK:- didTransition

    //Unit Test Complete
    func test_txtFieldAnnualActivities_is_toggled_from_disabled_to_enabled(){
        let sut: TableViewCellAnnualStat = makeTableViewCellAnnualStat(txtFieldsEnabled: false)
        
        sut.didTransition(to: .showingEditControl)
        
        XCTAssertTrue(sut.txtFieldAnnualActivities.isEnabled)
    }
    
    //Unit Test Complete
    func test_txtFieldAnnualActivities_remains_enabled_if_already_enabled() {
        let sut: TableViewCellAnnualStat = makeTableViewCellAnnualStat(txtFieldsEnabled: true)
        
        sut.didTransition(to: .showingEditControl)
        
        XCTAssertTrue(sut.txtFieldAnnualActivities.isEnabled)
    }
    
    //Unit Test Complete
    func test_txtFieldAnnualMiles_is_toggled_from_disabled_to_enabled(){
        let sut: TableViewCellAnnualStat = makeTableViewCellAnnualStat(txtFieldsEnabled: false)
        
        sut.didTransition(to: .showingEditControl)
        
        XCTAssertTrue(sut.txtFieldAnnualMiles.isEnabled)
    }
    
    //Unit Test Complete
    func test_txtFieldAnnualMiles_remains_enabled_if_already_enabled() {
        let sut: TableViewCellAnnualStat = makeTableViewCellAnnualStat(txtFieldsEnabled: true)
        
        sut.didTransition(to: .showingEditControl)
        
        XCTAssertTrue(sut.txtFieldAnnualMiles.isEnabled)
    }
}

extension TableViewCellAnnualStatTests {
    
    //Helper Method Complete
    private func assertTableViewRowsAreEqual(_ expected: TableViewRow, _ actual: TableViewRow) {
        XCTAssertEqual(expected.stat1, actual.stat1)
        XCTAssertEqual(expected.stat2, actual.stat2)
    }
    
    //Helper Method Complete
    private func makeTableViewCellAnnualStat(txtFieldsEnabled: Bool = false, txtFieldsText: (String, String) = ("", "")) -> TableViewCellAnnualStat {
        let sut = TableViewCellAnnualStat()
        
        func initAnnualActivitiesTextFieldOutlet() {
            sut.txtFieldAnnualActivities = UITextField()
            sut.txtFieldAnnualActivities.isEnabled = txtFieldsEnabled
            sut.txtFieldAnnualActivities.text = txtFieldsText.0
        }
        
        func initAnnualMilesTextFieldOutlet() {
            sut.txtFieldAnnualMiles = UITextField()
            sut.txtFieldAnnualMiles.text = txtFieldsText.1
            sut.txtFieldAnnualMiles.isEnabled = txtFieldsEnabled
        }
        
        initAnnualActivitiesTextFieldOutlet()
        initAnnualMilesTextFieldOutlet()
        
        return sut
    }
}
