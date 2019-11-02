import XCTest
import UIKit
import Charts

class Ext_ChartColortemplateTests: XCTestCase {
    
    func test_foo_hasFiveColors() {
        let expected = 15
        let actual = ChartColorTemplates.stewsStatsColourful().count
        
        XCTAssertEqual(expected, actual)
    }

    func test_foo_stuffs_themeColorOneIsCorrect() {
        let actual: NSUIColor = ChartColorTemplates.stewsStatsColourful().first!
        let expected = NSUIColor(red: 237.0/255.0, green: 186.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_foo_stuffs_themeColorTwoIsCorrect() {
        let actual: NSUIColor = ChartColorTemplates.stewsStatsColourful().first!
        let expected = NSUIColor(red: 237.0/255.0, green: 186.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_foo_stuffs_themeColorThreeIsCorrect() {
        let actual: NSUIColor = ChartColorTemplates.stewsStatsColourful().first!
        let expected = NSUIColor(red: 237.0/255.0, green: 186.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_foo_stuffs_themeColorFourIsCorrect() {
        let actual: NSUIColor = ChartColorTemplates.stewsStatsColourful().first!
        let expected = NSUIColor(red: 237.0/255.0, green: 186.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_foo_stuffs_themeColorFiveIsCorrect() {
        let actual: NSUIColor = ChartColorTemplates.stewsStatsColourful().first!
        let expected = UIColor.orange
        
        XCTAssertEqual(expected, actual)
    }
    
    
}
