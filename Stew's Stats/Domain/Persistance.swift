//
//  Persistance.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 18/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

class Persistance {
    
    static let shared = Persistance()
    
    private init() {}
    
    func retrievePersistedData() -> TableSection {
        if let savedData = UserDefaults.standard.data(forKey: "tableViewData") {
            let data = (try? JSONDecoder().decode(TableSection.self, from: savedData))!
            return data
        } else {
            return TableSection()
        }
    }
    
    func persistUserData(tableViewData: TableSection) {
        if let encoded = try? JSONEncoder().encode(tableViewData) {
            UserDefaults.standard.set(encoded, forKey: "tableViewData")
        } else {
            //display try again error message
        }
    }
}
