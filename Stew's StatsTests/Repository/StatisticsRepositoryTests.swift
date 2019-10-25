import XCTest
@testable import Stew_s_Stats

class StatisticsRepositoryTests: XCTestCase {

    func test_getStatistics_shouldCallRetrieve_exactlyOnce() {
        let stubUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        let mockStatisticsDecoder = FakeStatisticsDecoder(userDefaults: stubUserDefaults, jsonDecoder: stubJsonDecoder)
        
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        let stubStatisticsEncoder = FakeStatisticsEncoder(userDefaults: stubUserDefaults, jsonEncoder: stubJsonEncoder)
        
        let stubStatisticsFactory = FakeStatisticsFactory()
        
        let sut = StatisticsRepository(statisticsDecoder: mockStatisticsDecoder, statisticsEncoder: stubStatisticsEncoder, statisticsFactory: stubStatisticsFactory)
        
        _ = try! sut.getStatistics(.daily)
        
        let expected = 101
        let actual = mockStatisticsDecoder.retrieveCallCount
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_getStatistics_shouldCallRetrieve_withCorrectKey() {
        let stubUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        let mockStatisticsDecoder = FakeStatisticsDecoder(userDefaults: stubUserDefaults, jsonDecoder: stubJsonDecoder)
        
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        let stubStatisticsEncoder = FakeStatisticsEncoder(userDefaults: stubUserDefaults, jsonEncoder: stubJsonEncoder)
        let fakeStatsFactory = FakeStatisticsFactory()
        let sut = StatisticsRepository(statisticsDecoder: mockStatisticsDecoder, statisticsEncoder: stubStatisticsEncoder, statisticsFactory: fakeStatsFactory)
        
        _ = try! sut.getStatistics(.daily)
        
        let expected: StatisticsReport = .annual
        let actual = mockStatisticsDecoder.key
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_getStatistics_shouldReturnCorrectStatistics_ifNoErrorThrown() {
    }
    
    //should never call statistics
    
    func test_getStatistics_shouldCallGetStatistics_once_ifErrorThrown() {}

    func test_getStatistics_call_withCorrectKey_jsondecode_errorthrown_getStatisticsCalledOnce() {
        let stubUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: true)
        let mockStatisticsDecoder = FakeStatisticsDecoder(userDefaults: stubUserDefaults, jsonDecoder: stubJsonDecoder)
        
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        let stubStatisticsEncoder = FakeStatisticsEncoder(userDefaults: stubUserDefaults, jsonEncoder: stubJsonEncoder)
        let fakeStatsFactory = FakeStatisticsFactory()
        let sut = StatisticsRepository(statisticsDecoder: mockStatisticsDecoder, statisticsEncoder: stubStatisticsEncoder, statisticsFactory: fakeStatsFactory)
        
        _ = try! sut.getStatistics(.daily)
        
        let expected: StatisticsReport = .annual
        let actual = mockStatisticsDecoder.key
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_getStatistics_callRetrieve_withCorrectKey_jsondecode_errorthrown_getStatisticsCalledCorrKey() {
        let stubUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: true)
        let mockStatisticsDecoder = FakeStatisticsDecoder(userDefaults: stubUserDefaults, jsonDecoder: stubJsonDecoder)
        
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        let stubStatisticsEncoder = FakeStatisticsEncoder(userDefaults: stubUserDefaults, jsonEncoder: stubJsonEncoder)
        let fakeStatsFactory = FakeStatisticsFactory()
        let sut = StatisticsRepository(statisticsDecoder: mockStatisticsDecoder, statisticsEncoder: stubStatisticsEncoder, statisticsFactory: fakeStatsFactory)
        
        _ = try! sut.getStatistics(.daily)
        
        let expected: StatisticsReport = .annual
        let actual = mockStatisticsDecoder.key
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_getStatistics_callRetrieve_withCorrectKey__() {
        let stubUserDefaults = FakeUserDefaults()
        let stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        let mockStatisticsDecoder = FakeStatisticsDecoder(userDefaults: stubUserDefaults, jsonDecoder: stubJsonDecoder)
        
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        let stubStatisticsEncoder = FakeStatisticsEncoder(userDefaults: stubUserDefaults, jsonEncoder: stubJsonEncoder)
        let fakeStatsFactory = FakeStatisticsFactory()
        let sut = StatisticsRepository(statisticsDecoder: mockStatisticsDecoder, statisticsEncoder: stubStatisticsEncoder, statisticsFactory: fakeStatsFactory)
        
        _ = try! sut.getStatistics(.daily)
        
        let expected: StatisticsReport = .annual
        let actual = mockStatisticsDecoder.key
        
        XCTAssertEqual(expected, actual)
    }
}

/*
class TestableStatisticsRepository: StatisticsRepository {
    
    init(dependencies: Dependencies) {
        super.init(
            statisticsDecoder: dependencies.mockStatisticsDecoder,
            statisticsEncoder: dependencies.stubStatisticsEncoder,
            statisticsFactory: dependencies.stubStatisticsFactory)
    }
}
 */

/*
class Dependencies {
    let stubUserDefaults: FakeUserDefaults!
    let stubJsonDecoder: FakeJSONDecoder!
    let mockStatisticsDecoder: FakeStatisticsDecoder!
    let stubJsonEncoder: FakeJSONEncoder!
    let stubStatisticsEncoder: FakeStatisticsEncoder!
    let stubStatisticsFactory: FakeStatisticsFactory!
    
    init() {
        stubUserDefaults = FakeUserDefaults()
        stubJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        mockStatisticsDecoder = FakeStatisticsDecoder(
            userDefaults: stubUserDefaults,
            jsonDecoder: stubJsonDecoder
        )
        
        let stubJsonEncoder = FakeJSONEncoder(throwsEncodeError: false)
        stubStatisticsEncoder = FakeStatisticsEncoder(
            userDefaults: stubUserDefaults,
            jsonEncoder: stubJsonEncoder
        )
        
        stubStatisticsFactory = FakeStatisticsFactory()
    }
    
    func makeDefaultStatisticsRepository() -> StatisticsRepository {
        let sut = StatisticsRepository(
            statisticsDecoder: mockStatisticsDecoder,
            statisticsEncoder: stubStatisticsEncoder,
            statisticsFactory: stubStatisticsFactory
        )
        return sut
    }
}
 */

class FakeStatisticsDecoder: StatisticsDecoder {
    var retrieveCallCount = 0
    var key: StatisticsReport!
    
    override func retrieve(_ key: StatisticsReport) throws -> Statistics {
        retrieveCallCount += 1
        self.key = key
        return Statistics(saveKey: .daily, sections: [])
    }
}

class FakeStatisticsEncoder: StatisticsEncoder {
    override func persist(statistics: Statistics) throws {
        
    }
}

class FakeStatisticsFactory: StatisticsFactory {
    override func getStatistics(key: StatisticsReport) -> Statistics {
        return Statistics(saveKey: .daily, sections: [])
    }
}
