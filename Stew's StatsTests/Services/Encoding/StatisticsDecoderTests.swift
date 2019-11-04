import XCTest
@testable import Stew_s_Stats

class StatisticsDecoderTests: XCTestCase {

    func test_dataMethodShouldBeCalledOnce() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJSONDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: stubJSONDecoder
        )
        
        _ = try! sut.retrieve(.daily)
        
        let expected = 1
        let actual = mockUserDefaults.dataCallCount
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_dataMethodShouldBeCalledWithCorrectKey() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJSONDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: stubJSONDecoder
        )
        
        _ = try! sut.retrieve(.daily)
        
        let expected = "daily"
        let actual = mockUserDefaults.forKey
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_decodeMethodShouldBeCalledOnceIfDataCallSucceedsWithoutError() {
        let stubUserDefaults = FakeUserDefaults()
        let mockJSONDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: stubUserDefaults,
            jsonDecoder: mockJSONDecoder
        )
        
        _ = try! sut.retrieve(.daily)
        
        let expected = 1
        let actual = mockJSONDecoder.decodeCallCount
        
        XCTAssertEqual(expected, actual)
    }
    
    //test_decodeMethodShouldBeCalledWithTheCorrectType
    func test_decodeMethodShouldBeCalledWithCorrectType() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: stubJsonDecoder
        )
        
        _ = try! sut.retrieve(.daily)
        
        XCTAssertTrue(stubJsonDecoder.type is Statistics)
        
        //complete
    }
    
    func test_decodeMethodShouldBeCalledWithCorrectData() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: stubJsonDecoder
        )
        
        _ = try! sut.retrieve(.daily)
        
        let expected = Data(capacity: 10)
        
        
        //complete
    }
    
    func test_decodeMethodShouldReturnCorrectStatisticsIfItSucceedsWithoutError() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
               
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: stubJsonDecoder
        )
        
        _ = try! sut.retrieve(.daily)
        
        //complete
    }
    
    func test_retrieve_decodeFailsWithError_correctErrorThrown() {
       let stubUserDefaults = FakeUserDefaults()
       let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
               
        let sut = StatisticsDecoder(
            userDefaults: stubUserDefaults,
            jsonDecoder: stubJsonDecoder
        )
        
        XCTAssertThrowsError(try sut.retrieve(.daily), "") { error in
        let expected = StatisticsDecoder.UserPreferenceError.retrievalFailed
            let actual = error as! StatisticsDecoder.UserPreferenceError
            
            XCTAssertEqual(expected, actual)
        }
    }
    
    func test_retrieve_dataCallIsNil_retrievalFailedErrowThrown() {
        let stubUserDefaults = FakeUserDefaults()
        stubUserDefaults.dataToReturn = nil
        
        let stubJSONDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: stubUserDefaults,
            jsonDecoder: stubJSONDecoder
        )

       XCTAssertThrowsError(try sut.retrieve(.daily), "") { error in
        let expected = StatisticsDecoder.UserPreferenceError.retrievalFailed
            let actual = error as! StatisticsDecoder.UserPreferenceError
            
            XCTAssertEqual(expected, actual)
        }
    }
    
    func test_retrieve_dataCallIsNil_decodeIsNeverCalled() {
        let stubUserDefaults = FakeUserDefaults()
        let mockJSONDecoder = FakeJSONDecoder(throwsDecodeError: false)
               
        let sut = StatisticsDecoder(
                userDefaults: stubUserDefaults,
                jsonDecoder: mockJSONDecoder
        )
               
        _ = try! sut.retrieve(.daily)
               
        let expected = 1
        let actual = mockJSONDecoder.decodeCallCount
               
        XCTAssertEqual(expected, actual)
    }
}

class FakeJSONDecoder: JSONDecoder {
    var decodeCallCount = 0
    var type: Decodable.Type!
    var data: Decodable!
    var throwsDecodeError = false
    
    init(throwsDecodeError: Bool) {
        self.throwsDecodeError = throwsDecodeError
    }
    
    override func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        decodeCallCount += 1
        self.type = type
        self.data = data
        
        if throwsDecodeError {
            throw TestError.anyOldError
        }
        
        return Statistics(saveKey: .daily, sections: [TableViewSection(name: "TableViewSection 1", rows: [])]) as! T
    }
    
    enum TestError: Error {
        case anyOldError
    }
}
