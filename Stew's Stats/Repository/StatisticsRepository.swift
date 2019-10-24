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
    
    func getStatistics(_ key: StatisticsReport) throws -> Statistics {
        do {
            return try statisticsDecoder.retrieve(.daily)
        } catch {
            //save should really be in here though that is a side effect
            //need to call save but in a none side effecty way
            //look into error handlin swift 5.1 a bit more
            return statisticsFactory.getStatistics(key: key)
        }
    }
    
    func save(statistics: Statistics) throws {
        try statisticsEncoder.persist(statistics: statistics)
    }
}

class StatisticsFactory {
    func getStatistics(key: StatisticsReport) -> Statistics {
        switch key {
        case .daily:
            let sections = DailyActivityStatisticsSeedData().getSeedData()
            return Statistics(saveKey: key, sections: sections)
        case .annual:
            let sections = AnnualActivityStatisticsSeedData().getSeedData()
            return Statistics(saveKey: key, sections: sections)
        }
    }
}


