//
//  Ext_ChartColorTemplates.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 29/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Charts
import Foundation

extension ChartColorTemplates {
    static func stewsStatsColourful() -> [NSUIColor] {
        let colors: [NSUIColor] = [
            NSUIColor(red: 223.0/255.0, green: 52.0/255.0, blue: 46.0/255.0, alpha: 1.0),
            NSUIColor(red: 44.0/255.0, green: 197.0/255.0, blue: 94.0/255.0, alpha: 1.0),
            NSUIColor(red: 43.0/255.0, green: 132.0/255.0, blue: 210.0/255.0, alpha: 1.0),
            NSUIColor(red: 237.0/255.0, green: 186.0/255.0, blue: 16.0/255.0, alpha: 1.0),
            NSUIColor.orange,
        ]
        return colors
    }
}
