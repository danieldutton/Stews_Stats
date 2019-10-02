//
//  Persistance.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 18/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

enum Key: String {
    case one
    case two
}

class Persistance {
    
    static let shared = Persistance()
    
    private init() {}
    
    func retrievePersistedData(_ key: Key) -> [Section] {
        if let savedData = UserDefaults.standard.data(forKey: key.rawValue) {
            let data = (try? JSONDecoder().decode([Section].self, from: savedData))!
            return data
        } else {
            return []
        }
    }
    
    func persistUserData(tableViewData: [Section], with key: Key) {
        if let encoded = try? JSONEncoder().encode(tableViewData) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        } else {
            //display try again error message
        }
    }
}
