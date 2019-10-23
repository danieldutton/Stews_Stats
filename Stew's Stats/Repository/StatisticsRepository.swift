import Foundation

class StatisticsRepository {
    
    private var statisticsDecoder: StatisticsDecoder!
    
    private var statisticsEncoder: StatisticsEncoder!
    
    private var statisticsFactory: StatisticsFactory!
    
    
    init(statisticsDecoder: StatisticsDecoder = StatisticsDecoder(),
         statisticsEncoder: StatisticsEncoder = StatisticsEncoder(),
         statisticsFactory: StatisticsFactory = StatisticsFactory()) {
        
        self.statisticsDecoder = statisticsDecoder
        self.statisticsEncoder = statisticsEncoder
        self.statisticsFactory = statisticsFactory
    }
    
    func getStatistics(_ key: UserPrefsKey) throws -> Statistics {
        return try statisticsDecoder.retrieve(.dailySummary)
    }
    
    func save(statistics: Statistics) throws {
        try statisticsEncoder.persist(statistics: statistics)
    }
}

class StatisticsFactory {
    func getStatistics(key: UserPrefsKey) -> Statistics {
        return Statistics(saveKey: .dailySummary, sections: [])
    }
}


