//
//  TableViewData.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 18/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

class TableViewData: Codable {
    let section: [String] = ["Distance", "Duration", "Surface", "Weather", "Mood", "Location"]
    
    var items: [[String]] = [
        ["1-5 miles", "5-10 miles", "10-15 miles", "15-20 miles", "20-30 miles"],
        ["< 30 mins", "30-60 mins", "1-2 hours", "2-3 hours", "3-5 hours"],
        ["Road", "Mixed", "Trail", "Beach", "Wilderness"],
        ["Sunny", "Cloudy", "Rainy", "Snowy", "Night"],
        ["Awesome", "Good", "So-So", "Sluggish", "Injured"],
        
        [
            "Belfast", "Nottensdorf", "Buxtehude", "Fleetwood", "Scheidholz",
            "Bo'ness", "Wedel", "Hahnenbalken", "Cleveleys", "Marston",
            "Caton", "Littleborough", "Daestorf", "Thornton-Cleveleys", "Ripponden",
            "Rivington", "Sankt Georg", "Niederhaverbeck", "Marizion", "Par",
            "Chipping", "Goosnargh", "Barton", "Lostwithiel", "Hamburg-Mitte",
            "Saddleworth","Bergedorf", "Mittelnkirchen", "Bodmin", "Tywardreath",
            "Great Marton", "Mawgan Porth", "Drochtersen", "Bassenfleth", "Saint Dennis",
            "Weaverham", "Alderley Edge", "Timperley", "Rochdale"
        ],
    ]
    
    var data: [[String]] = [
        ["0","0","0","0","0"],
        ["0","0","0","0","0"],
        ["0","0","0","0","0"],
        ["0","0","0","0","0"],
        ["0","0","0","0","0"],
        
        [
            "0","0","0","0","0",
            "0","0","0","0","0",
            "0","0","0","0","0",
            "0","0","0","0","0",
            "0","0","0","0","0",
            "0","0","0","0","0",
            "0","0","0","0","0",
            "0","0","0","0"
        ],
    ]
}
