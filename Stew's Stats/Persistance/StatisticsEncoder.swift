import Foundation

class StatisticsEncoder {
    
    private var userDefaults: UserDefaults!
    
    private var jsonEncoder: JSONEncoder!
    
    
    init(userDefaults: UserDefaults = UserDefaults(suiteName: "group.StewsStats")!,
         jsonEncoder: JSONEncoder = JSONEncoder()) {
        
        self.userDefaults = userDefaults
        self.jsonEncoder = jsonEncoder
    }
    
    func persist(statistics: Statistics) throws {
        do {
            let encodedStats = try jsonEncoder.encode(statistics)
            
            userDefaults.set(encodedStats, forKey: statistics.saveKey!.rawValue)
        } catch {
            throw StatisticsSaveError.saveFailed
        }
    }
    
    enum StatisticsSaveError: Error {
        case saveFailed
    }
}


