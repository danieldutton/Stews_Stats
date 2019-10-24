import XCTest
@testable import Stew_s_Stats

class StatisticsRepositoryTests: XCTestCase {

    func test_getStatistics_callRetrieve_exactlyOnce() {
        let fakeUserDefaults = FakeUserDefaults()
        let fakeJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        let fakeStatisticsDecoder = FakeStatisticsDecoder(userDefaults: fakeUserDefaults, jsonDecoder: fakeJsonDecoder)
        
        let fakeJSONEncoder = FakeJSONEncoder(throwsEncodeError: false)
        let fakeStatsEncoder = FakeStatisticsEncoder(userDefaults: fakeUserDefaults, jsonEncoder: fakeJSONEncoder)
        let fakeStatsFactory = FakeStatisticsFactory()
        let sut = StatisticsRepository(statisticsDecoder: fakeStatisticsDecoder, statisticsEncoder: fakeStatsEncoder, statisticsFactory: fakeStatsFactory)
        
        _ = try! sut.getStatistics(.daily)
        
        let expected = 101
        let actual = fakeStatisticsDecoder.retrieveCallCount
        
        XCTAssertEqual(expected, actual)
    }
    
    func test_getStatistics_callRetrieve_withCorrectKey() {
        let fakeUserDefaults = FakeUserDefaults()
        let fakeJsonDecoder = FakeJSONDecoder(throwsDecodeError: false)
        let fakeStatisticsDecoder = FakeStatisticsDecoder(userDefaults: fakeUserDefaults, jsonDecoder: fakeJsonDecoder)
        
        let fakeJSONEncoder = FakeJSONEncoder(throwsEncodeError: false)
        let fakeStatsEncoder = FakeStatisticsEncoder(userDefaults: fakeUserDefaults, jsonEncoder: fakeJSONEncoder)
        let fakeStatsFactory = FakeStatisticsFactory()
        let sut = StatisticsRepository(statisticsDecoder: fakeStatisticsDecoder, statisticsEncoder: fakeStatsEncoder, statisticsFactory: fakeStatsFactory)
        
        _ = try! sut.getStatistics(.daily)
        
        let expected: StatisticsReport = .annual
        let actual = fakeStatisticsDecoder.key
        
        XCTAssertEqual(expected, actual)
    }
    
}

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
