//
//  TableSection.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 18/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

struct Row: Codable, Hashable {
    var stat1: String
    var stat2: String
}

struct Section: Codable {
    var name: String
    var rows: [Row] = []
}

extension Section: Equatable, Comparable {
    static func < (lhs: Section, rhs: Section) -> Bool {
        return Int(lhs.name)! < Int(rhs.name)!
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Section: Hashable {}


