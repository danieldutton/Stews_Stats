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
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        
        [
            "1","2","3","4","5",
            "6","7","8","9","10",
            "11","12","13","14","15",
            "16","17","18","19","20",
            "21","22","23","24","25",
            "26","27","28","29","30",
            "31","32","33","34","35",
            "36","37","38","39"
        ],
    ]
}
