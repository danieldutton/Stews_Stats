import XCTest

class TableViewCellDailyStatTests: XCTestCase {

    //MARK:- didTransition
    
    func test_textField_enabled_if_originally_disabled() {
        let sut: TableViewCellDailyStat = makeTableViewCellDailyStat(txtFieldEnabled: false)
        
        sut.didTransition(to: .showingEditControl)
        
        XCTAssertFalse(sut.txtFieldStatValue.isEnabled)
    }
    
    func test_textField_enabled_if_originally_enabled() {
        let sut: TableViewCellDailyStat = makeTableViewCellDailyStat(txtFieldEnabled: true)
        
        sut.didTransition(to: .showingEditControl)
        
        XCTAssertFalse(sut.txtFieldStatValue.isEnabled)
    }
    
    func test_originalZ_position_correct() {
        
    }
    
    func test_z_position_changed() {
        
    }
}

extension TableViewCellDailyStatTests {

    private func assertTableViewRowsAreEqual(_ expected: TableViewRow, _ actual: TableViewRow) {
        XCTAssertEqual(expected.stat1, actual.stat1)
        XCTAssertEqual(expected.stat2, actual.stat2)
    }
    
    func makeTableViewCellDailyStat(txtFieldEnabled: Bool = false, outletText: (String, String) = ("", "")) -> TableViewCellDailyStat {
        let sut = TableViewCellDailyStat()
        
        func initStatLabelOutlet() {
            sut.lblStat = UILabel()
            sut.lblStat.text = outletText.0
        }
        
        func initStatValueTextField() {
            sut.txtFieldStatValue = UITextField()
            sut.txtFieldStatValue.isEnabled = txtFieldEnabled
            sut.txtFieldStatValue.text = outletText.1
        }
        
        initStatLabelOutlet()
        initStatValueTextField()
        
        return sut
    }
}
