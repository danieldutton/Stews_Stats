import XCTest
import Charts

class Ext_ChartColortemplateTests: XCTestCase {
    
    //MARK:- dazzlingBright
    
    func test_themeHas5colours() {
        let expectedColourCount = 5
        let actualColourCount: Int = ChartColorTemplates.dazzlingBright.count
        
        XCTAssertEqual(expectedColourCount, actualColourCount)
    }

    func test_1stThemeColourIsRed() {
        let expectedColour: NSUIColor = makeExpectedColour(r: 223.0, g: 52.0, b: 46.0)
        let actualColour: NSUIColor = ChartColorTemplates.dazzlingBright[0]
        
        XCTAssertEqual(expectedColour, actualColour)
    }
    
    func test_2ndThemeColourIsBlue() {
        let expectedColour: NSUIColor = makeExpectedColour(r: 44.0, g: 197.0, b: 94.0)
        let actualColour: NSUIColor = ChartColorTemplates.dazzlingBright[1]
        
        XCTAssertEqual(expectedColour, actualColour)
    }
    
    func test_3rdThemeColourIsGreen() {
        let expectedColour: NSUIColor = makeExpectedColour(r: 43.0, g: 132.0, b: 210.0)
        let actualColour: NSUIColor = ChartColorTemplates.dazzlingBright[2]
        
        XCTAssertEqual(expectedColour, actualColour)
    }
    
    func test_4thThemeColourIsYellow() {
        let expectedColour: NSUIColor = makeExpectedColour(r: 237.0, g: 186.0, b: 16.0)
        let actualColour: NSUIColor = ChartColorTemplates.dazzlingBright[3]

        XCTAssertEqual(expectedColour, actualColour)
    }
    
    func test_5thThemeColourIsOrange() {
        let expectedColour: NSUIColor = UIColor.orange
        let actualColour: NSUIColor = ChartColorTemplates.dazzlingBright[4]
        
        XCTAssertEqual(expectedColour, actualColour)
    }
    
    func test_eachThemeColourHasAnAlphaValueOf_1() {
        let expectedAlphaValues: [CGFloat] = Array(repeating: 1.0, count: 5)
        let actualAlphaValues: [CGFloat] = ChartColorTemplates.dazzlingBright.map {$0.cgColor.alpha}
        
        XCTAssertEqual(expectedAlphaValues, actualAlphaValues)
    }
}

extension Ext_ChartColortemplateTests {
    
    func makeExpectedColour(r: CGFloat, g: CGFloat, b: CGFloat) -> NSUIColor {
        NSUIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
