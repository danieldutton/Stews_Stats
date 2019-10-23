import XCTest
@testable import Stew_s_Stats

class StatisticsEncoderTests: XCTestCase {

    func test_persist_encodeIsCalled_exactlyOnce() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)
        
        try? sut.persist(statistics: statistics)
        
        let expected = 1
        let actual = mockJsonEncoder.encodeCallCount
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_persist_encodeIsCalled_withCorrectType() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)
        
        try? sut.persist(statistics: statistics)
        
        XCTAssertTrue(mockJsonEncoder.value is Statistics)
    }

    func test_persist_encodeIsCalled_withCorrectStatistics() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)
        
        try? sut.persist(statistics: statistics)
        
        let expected = statistics
        let actual = mockJsonEncoder.value as! Statistics
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_persist_encodeCallSucceedsWithoutError_setIsCalledExactlyOnce() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)
        
        try? sut.persist(statistics: statistics)
        
        let expected = 1
        let actual = mockUserDefaults.setCount
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_persist_encodeCallSucceedsWithoutError_setIsCalledWithCorrectData() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)
        
        try? sut.persist(statistics: statistics)
        
        let expected =  Data(capacity: 10)
        let actual = mockUserDefaults.value as! Data
        
        XCTAssertEqual(expected,actual)
    }
    
    func test_persist_encodeCallSucceedsWithoutError_setIsCalledWithCorrectKey() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)
        
        try? sut.persist(statistics: statistics)
        
        let expected = "dailySummary"
        let actual = mockUserDefaults.forKey
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_persist_encodeCallFailsWithError_saveFailedErrorIsThrown() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: true)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)

        XCTAssertThrowsError(try sut.persist(statistics: statistics), "") { error in
            let expected = StatisticsEncoder.StatisticsSaveError.saveFailed
            let actual = error as! StatisticsEncoder.StatisticsSaveError
            
            XCTAssertEqual(expected, actual)
        }
    }
    
    func test_persist_encodeCallFailsWithError_setIsNeverCalled() {
        let mockUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: true)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        let sections = [Section(name: "Section 1", rows: [Row(stat1: "Row1-stat1", stat2: "Row1-stat2")])]
        let statistics = Statistics(saveKey: .dailySummary, sections: sections)
        
        try? sut.persist(statistics: statistics)
        
        let expected = 0
        let actual = mockUserDefaults.setCount
        
        XCTAssertEqual(expected, actual)
    }
}

class FakeJSONEncoder: JSONEncoder {
    var encodeCallCount = 0
    var value: Encodable!
    var throwsEncodeError = false
    
    init(throwsEncodeError: Bool) {
        self.throwsEncodeError = throwsEncodeError
    }
    
    override func encode<T>(_ value: T) throws -> Data where T : Encodable {
        encodeCallCount += 1
        self.value = value
        
        if throwsEncodeError {
            throw EncodeError.anyOldError
        }
        return Data(capacity: 5)
    }
    
    enum EncodeError: Error {
        case anyOldError
    }
}


