import XCTest
@testable import Stew_s_Stats

class StatisticsRepositoryTests: XCTestCase {

    func test_getStatistics_callRetrieve_exactlyOnce() {
        
    }
    
    func test_getStatistics_callRetrieve_withCorrectKey() {
        
    }
    
}

class FakeStatisticsDecoder: StatisticsDecoder {
    override func retrieve(_ key: UserPrefsKey) throws -> Statistics {
        return Statistics(saveKey: .dailySummary, sections: [])
    }
}

class FakeStatisticsEncoder: StatisticsEncoder {
    override func persist(statistics: Statistics) throws {
        
    }
}

class FakeStatisticsFactory: StatisticsFactory {
    override func getStatistics(key: UserPrefsKey) -> Statistics {
        return Statistics(saveKey: .dailySummary, sections: [])
    }
}
