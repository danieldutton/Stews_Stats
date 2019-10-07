//
//  StewsRuntasticData.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 29/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

class StewsRuntasticData: SeedData {
    
    func getSeedData() -> [Section] {
        let section_distance = Section(name: "Distance", rows: [
            Row(statName: "1-5 miles", statValue: "323"),
            Row(statName: "5-10 miles", statValue: "913"),
            Row(statName: "10-15 miles", statValue: "117"),
            Row(statName: "15-20 miles", statValue: "1"),
            Row(statName: "20-30 miles", statValue: "0"),
        ])
        let section_duration = Section(name: "Duration", rows: [
            Row(statName: "< 30 mins", statValue: "21"),
            Row(statName: "30-60 mins", statValue: "59"),
            Row(statName: "1-2 hours", statValue: "662"),
            Row(statName: "2-3 hours", statValue: "488"),
            Row(statName: "3-5 hours", statValue: "125"),
        ])
        let section_surface = Section(name: "Surface", rows: [
            Row(statName: "Road", statValue: "43"),
            Row(statName: "Mixed", statValue: "190"),
            Row(statName: "Trail", statValue: "324"),
            Row(statName: "Beach", statValue: "786"),
            Row(statName: "Wilderness", statValue: "11"),
        ])
        let section_weather = Section(name: "Weather", rows: [
            Row(statName: "Sunny", statValue: "449"),
            Row(statName: "Cloudy", statValue: "629"),
            Row(statName: "Rainy", statValue: "208"),
            Row(statName: "Snowy", statValue: "13"),
            Row(statName: "Night", statValue: "55"),
        ])
        let section_mood = Section(name: "Mood", rows: [
            Row(statName: "Awesome", statValue: "417"),
            Row(statName: "Good", statValue: "626"),
            Row(statName: "So-So", statValue: "199"),
            Row(statName: "Sluggish", statValue: "90"),
            Row(statName: "Injured", statValue: "22"),
        ])
        let section_location = Section(name: "Location", rows: [
            Row(statName: "Fleetwood", statValue: "743"),
            Row(statName: "Scheidholz", statValue: "112"),
            Row(statName: "Cleveleys", statValue: "104"),
            Row(statName: "Nottensdorf", statValue: "87"),
            Row(statName: "Littleborough", statValue: "46"),
            Row(statName: "Buxtehude", statValue: "44"),
            Row(statName: "Daestorf", statValue: "33"),
            Row(statName: "Belfast", statValue: "32"),
            Row(statName: "Rochdale", statValue: "30"),
            Row(statName: "Thornton", statValue: "16"),
            Row(statName: "Ripponden", statValue: "15"),
            Row(statName: "Chipping", statValue: "11"),
            Row(statName: "Barton", statValue: "11"),
            Row(statName: "Bo'ness", statValue: "10"),
            Row(statName: "Saddleworth", statValue: "7"),
            Row(statName: "Goosnargh", statValue: "7"),
            Row(statName: "Great Marton", statValue: "6"),
            Row(statName: "Hahnenbalken", statValue: "5"),
            Row(statName: "Par", statValue: "4"),
            Row(statName: "Rivington", statValue: "4"),
            Row(statName: "Mittelnkirchen", statValue: "3"),
            Row(statName: "Rudheath", statValue: "2"),
            Row(statName: "Sankt Georg", statValue: "2"),
            Row(statName: "Bassenfleth", statValue: "2"),
            Row(statName: "Tywardreath", statValue: "2"),
            Row(statName: "Bodmin", statValue: "2"),
            Row(statName: "Altona", statValue: "1"),
            Row(statName: "Wedel", statValue: "1"),
            Row(statName: "Niederhaverbeck", statValue: "1"),
            Row(statName: "Hamburg-Mitte", statValue: "1"),
            Row(statName: "Bergedorf", statValue: "1"),
            Row(statName: "Drochtersen", statValue: "1"),
            Row(statName: "Marston", statValue: "1"),
            Row(statName: "Caton", statValue: "1"),
            Row(statName: "Marizion", statValue: "1"),
            Row(statName: "Lostwithiel", statValue: "1"),
            Row(statName: "Mawgan Porth", statValue: "1"),
            Row(statName: "Saint Dennis", statValue: "1"),
            Row(statName: "Alderley Edge", statValue: "1"),
            Row(statName: "Timperley", statValue: "1"),
        ])
        
        return [
            section_distance,
            section_duration,
            section_surface,
            section_weather,
            section_mood,
            section_location
        ]
    }
}
