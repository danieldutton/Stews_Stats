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
            let encoded = try jsonEncoder.encode(statistics)
            userDefaults.set(encoded, forKey: statistics.saveKey!.rawValue)
        } catch {
            throw StatisticsSaveError.saveFailed
        }
    }
    
    enum StatisticsSaveError: Error {
        case saveFailed
    }
}


