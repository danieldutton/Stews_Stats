//
//  TableSection.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 18/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

struct Row: Codable {
    var stat1: String
    var stat2: String
}

struct Section: Codable {
    var name: String
    var rows: [Row] = []
}



