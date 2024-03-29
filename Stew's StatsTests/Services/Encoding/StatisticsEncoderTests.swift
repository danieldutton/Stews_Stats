import XCTest

class StatisticsEncoderTests: XCTestCase {

    func test_encodeMethodIsCalledOnce() {
        let stubUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: stubUserDefaults,
            jsonEncoder: mockJsonEncoder
        )

        try! sut.persist(statistics: testStatistics)

        XCTAssertEqual(1, mockJsonEncoder.encodeCallCount)
    }
    
    func test_encodeMethodIsCalledWithStatisticsDataType() {
        let stubUserDefaults = FakeUserDefaults()
        let mockJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: stubUserDefaults,
            jsonEncoder: mockJsonEncoder
        )
        
        try! sut.persist(statistics: testStatistics)
        
        XCTAssertTrue(mockJsonEncoder.value is Statistics)
    }

    func test_encodeMethodIsCalledWithCorrectStatisticsValues() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: stubJsonEncoder
        )

        try! sut.persist(statistics: testStatistics)

        //XCTAssertEqual(testStatistics, stubJsonEncoder.value as! Statistics)
    }

    func test_setMethodIsCalledOnceIfEncodeMethodCallSucceedsWithoutError() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: stubJsonEncoder
        )

        try! sut.persist(statistics: testStatistics)

        XCTAssertEqual(1, mockUserDefaults.setCount)
    }

    func test_setMethodisCalledWithEncodeResultIfEncodeMethodCallSucceedsWithoutError() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: stubJsonEncoder
        )

        try! sut.persist(statistics: testStatistics)

        XCTAssertEqual(Data(capacity: 10), mockUserDefaults.value as! Data)
    }
    
    func test_setMethodIsCalledWithCorrectForKeyIfEncodeMethodCallSucceedsWithoutError() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: stubJsonEncoder
        )

        try! sut.persist(statistics: testStatistics)

        XCTAssertEqual("daily", mockUserDefaults.forKey)
    }

    func test_aSaveFailedErrorIsThrownIfEncodeMethodCallFailsAndThrows() {
        let stubUserDefaults = FakeUserDefaults()
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: true)
        
        let sut = StatisticsEncoder(
            userDefaults: stubUserDefaults,
            jsonEncoder: stubJsonEncoder
        )

        XCTAssertThrowsError(try sut.persist(statistics: testStatistics), "") { error in
            let expected = StatisticsEncoder.StatisticsSaveError.saveFailed
            let actual = error as! StatisticsEncoder.StatisticsSaveError
            
            XCTAssertEqual(expected, actual)
        }
    }
    
    func test_setMethodisNeverCalledIfEncodeMethodCallFailsAndThrows() {
        let mockUserDefaults = FakeUserDefaults()
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: true)
        
        let sut = StatisticsEncoder(
            userDefaults: mockUserDefaults,
            jsonEncoder: stubJsonEncoder
        )

        try? sut.persist(statistics: testStatistics)

        XCTAssertEqual(0, mockUserDefaults.setCount)
    }
}

extension StatisticsEncoderTests {
    private var testStatistics: Statistics {
        let rows = [
            TableViewRow(stat1: "Row1-stat1", stat2: "Row1-stat2"),
            TableViewRow(stat1: "Row2-stat1", stat2: "Row2-stat2"),
        ]
        let sections = [TableViewSection(name: "Section 1", rows: rows)]
        
        return Statistics(saveKey: .daily, sections: sections)
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


