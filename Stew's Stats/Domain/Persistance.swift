//
//  Persistance.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 18/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

class Persistance {
    
    func retrievePersistedData() -> TableViewData {
        if let savedData = UserDefaults.standard.data(forKey: "tableViewData") {
            let data = (try? JSONDecoder().decode(TableViewData.self, from: savedData))!
            return data
        } else {
            return TableViewData()
        }
    }
    
    func persistUserData(tableViewData: TableViewData) {
        if let encoded = try? JSONEncoder().encode(tableViewData) {
            UserDefaults.standard.set(encoded, forKey: "tableViewData")
        } else {
            //display try again error message
        }
    }
}
