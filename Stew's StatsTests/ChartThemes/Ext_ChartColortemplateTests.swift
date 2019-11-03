import XCTest
import UIKit
import Charts

class Ext_ChartColortemplateTests: XCTestCase {
    
    func test_dazzlingBright_dazzinglyBrightTheme_hasFiveColours() {
        let expected = 5
        let actual = ChartColorTemplates.dazzlingBright.count
        
        XCTAssertEqual(expected, actual)
    }

    func test_dazzlingBright_1stThemeColour_isRed() {
        let expected = makeExpectedColour(r: 223.0, g: 52.0, b: 46.0)
        let actual: NSUIColor = ChartColorTemplates.dazzlingBright[0]
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_dazzlingBright_2ndThemeColour_isGreen() {
        let actual: NSUIColor = ChartColorTemplates.dazzlingBright[1]
        let expected = NSUIColor(red: 44.0/255.0, green: 197.0/255.0, blue: 94.0/255.0, alpha: 1.0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_dazzlingBright_3rdThemeColour_isBlue() {
        let actual: NSUIColor = ChartColorTemplates.dazzlingBright[2]
        let expected = NSUIColor(red: 43.0/255.0, green: 132.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_dazzlingBright_4thThemeColour_isGreen() {
        let actual: NSUIColor = ChartColorTemplates.dazzlingBright[3]
        let expected = NSUIColor(red: 237.0/255.0, green: 186.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_dazzlingBright_5thThemeColour_isOrange() {
        let actual: NSUIColor = ChartColorTemplates.dazzlingBright[4]
        let expected = UIColor.orange
        
        XCTAssertEqual(expected, actual)
    }
    
    func makeExpectedColour(r: CGFloat, g: CGFloat, b: CGFloat) -> NSUIColor {
        NSUIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}

struct RGB {
    let red: CGFloat
    let blue: CGFloat
    let green: CGFloat
}
