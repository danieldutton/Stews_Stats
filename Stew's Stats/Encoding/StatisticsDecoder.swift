import Foundation

class StatisticsDecoder {
    
    private static var appGroup = "group.StewsStats"

    private var userDefaults: UserDefaults!
    
    private var jsonDecoder: JSONDecoder!
    
    
    init(userDefaults: UserDefaults = UserDefaults(suiteName: appGroup)!,
         jsonDecoder: JSONDecoder = JSONDecoder()
    ) {
        self.userDefaults = userDefaults
        self.jsonDecoder = jsonDecoder
    }
    
    func retrieve(_ key: StatisticsReport) throws -> Statistics {
        let savedData = try getSavedData(key: key)
        
        return try jsonDecoder.decode(Statistics.self, from: savedData)
    }
    
    //srp?
    private func getSavedData(key: StatisticsReport) throws -> Data {
        if let savedData = userDefaults.data(forKey: key.rawValue) {
            return savedData
        } else {
            throw UserPreferenceError.retrievalFailed
        }
    }
    
    enum UserPreferenceError: Error {
        case retrievalFailed
    }
}
