import XCTest
@testable import Stew_s_Stats

class StatisticsDecoderTests: XCTestCase {

    func test_retrive_dataIsCalled_exactlyOnce() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )
        
        _ = try! sut.retrieve(.dailySummary)
        
        let expected = 1
        let actual = mockUserDefaults.dataCallCount
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_retrieve_dataIsCalled_withCorrectKey() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )
        
        _ = try! sut.retrieve(.dailySummary)
        
        let expected = "dailySummary"
        let actual = mockUserDefaults.forKey
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_retrieve_dataCallIsNil_retrievalFailedErrowThrown() {
        let mockUserDefaults = FakeUserDefaults()
        mockUserDefaults.dataToReturn = nil
        
        let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )

       XCTAssertThrowsError(try sut.retrieve(.dailySummary), "") { error in
        let expected = StatisticsDecoder.UserPreferenceError.retrievalFailed
            let actual = error as! StatisticsDecoder.UserPreferenceError
            
            XCTAssertEqual(expected, actual)
        }
    }
    
    func test_retrieve_dataCallIsNil_decodeIsNeverCalled() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
               
        let sut = StatisticsDecoder(
                userDefaults: mockUserDefaults,
                jsonDecoder: mockJsonDecoder
        )
               
        _ = try! sut.retrieve(.dailySummary)
               
        let expected = 1
        let actual = mockJsonDecoder.decodeCallCount
               
        XCTAssertEqual(expected, actual)
    }
    
    func test_retrieve_dataCallSucceedsWithoutError_decodeIsCalledExactlyOnce() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )
        
        _ = try! sut.retrieve(.dailySummary)
        
        let expected = 1
        let actual = mockJsonDecoder.decodeCallCount
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_retrieve_dataCallSucceedsWithoutError_decodeIsCalledWithCorrectType() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )
        
        _ = try! sut.retrieve(.dailySummary)
    }
    
    func test_retrieve_dataCallSucceedsWithoutError_decodeIsCalledWithCorrectData() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )
        
        _ = try! sut.retrieve(.dailySummary)
    }
    
    func test_retrieve_decodeCallSucceedsWithoutError_decodeReturnsCorrectStatistics() {
        let mockUserDefaults = FakeUserDefaults()
               let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
               
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )
        
        _ = try! sut.retrieve(.dailySummary)
    }
    
    func test_retrieve_decodeFailsWithError_correctErrorThrown() {
       let mockUserDefaults = FakeUserDefaults()
               let mockJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
               
        let sut = StatisticsDecoder(
            userDefaults: mockUserDefaults,
            jsonDecoder: mockJsonDecoder
        )
        
        XCTAssertThrowsError(try sut.retrieve(.dailySummary), "") { error in
        let expected = StatisticsDecoder.UserPreferenceError.retrievalFailed
            let actual = error as! StatisticsDecoder.UserPreferenceError
            
            XCTAssertEqual(expected, actual)
        }
    }
}

class FakeJSONDecoder: JSONDecoder {
    var decodeCallCount = 0
    var type: Decodable.Type!
    var data: Data!
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
        
        return Statistics(saveKey: .dailySummary, sections: [Section(name: "Section 1", rows: [])]) as! T
    }
    
    enum TestError: Error {
        case anyOldError
    }
}
