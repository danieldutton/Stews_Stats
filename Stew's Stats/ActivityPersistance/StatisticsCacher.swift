//
//  Persistance.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 18/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

enum UserPrefsKey: String {
    case dailySummary
    case annualSummary
}

class StatisticsCacher {
    
    private static var appGroup = "group.StewsStats"

    private var userDefaults: UserDefaults!
    
    private var jsonDecoder: JSONDecoder!
    
    private var jsonEncoder: JSONEncoder!
    
    
    init(userDefaults: UserDefaults = UserDefaults(suiteName: appGroup)!,
         jsonDecoder: JSONDecoder = JSONDecoder(),
         jsonEncoder: JSONEncoder = JSONEncoder()
    ) {
        self.userDefaults = userDefaults
        self.jsonDecoder = jsonDecoder
        self.jsonEncoder = jsonEncoder
    }

    func retrievePersistedData(_ key: UserPrefsKey) -> [Section] {
        var stats: [Section] = []
        
        if let savedData = userDefaults.data(forKey: key.rawValue) {
            do {
                stats = try jsonDecoder.decode([Section].self, from: savedData)
            } catch {
                let pHolderData = StatisticsPlaceHolderFactory.getPlaceholderStats(key)
                
                //persistUserData(tableViewData: pHolderData, with: key)
                
                //return pHolderData
                return []
            }
        }
        return stats
    }
    
    func persistUserData(tableViewData: [Section], with key: UserPrefsKey) {
        if let encoded = try? jsonEncoder.encode(tableViewData) {
            userDefaults.set(encoded, forKey: key.rawValue)
        } else {
            //display try again error message
        }
    }
}

class StatisticsPlaceHolderFactory {
    static func getPlaceholderStats(_ key: UserPrefsKey) -> Statistics {
        return Statistics(sections: [Section(name: "", rows: [])])
    }
}





