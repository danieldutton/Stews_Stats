//
//  StewsRuntasticData.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 29/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation

class StewsAnnualData: SeedData {
    func getSeedData() -> [Section] {
        let section_2014 = Section(sectionName: "2014", values: [
            Row(statName: "50 Activities", statValue: "900 Miles"),
        ])
        let section_2015 = Section(sectionName: "2015", values: [
            Row(statName: "100 Activities", statValue: "1800 Miles"),
        ])
        let section_2016 = Section(sectionName: "2016", values: [
            Row(statName: "150 Activities", statValue: "2700 Miles"),
        ])
        let section_2017 = Section(sectionName: "2017", values: [
            Row(statName: "200 Activities", statValue: "3600 Miles"),
        ])
        let section_2018 = Section(sectionName: "2018", values: [
            Row(statName: "250 Activities", statValue: "4500 Miles"),
        ])
        
        return [
            section_2014,
            section_2015,
            section_2016,
            section_2017,
            section_2018,
        ]
    }
}

class StewsRuntasticData: SeedData {
    
    func getSeedData() -> [Section] {
        let section_distance = Section(sectionName: "Distance", values: [
            Row(statName: "1-5 miles", statValue: "1"),
            Row(statName: "5-10 miles", statValue: "2"),
            Row(statName: "10-15 miles", statValue: "3"),
            Row(statName: "15-20 miles", statValue: "4"),
            Row(statName: "20-30 miles", statValue: "5"),
        ])
        let section_duration = Section(sectionName: "Duration", values: [
            Row(statName: "< 30 mins", statValue: "1"),
            Row(statName: "30-60 mins", statValue: "2"),
            Row(statName: "1-2 hours", statValue: "3"),
            Row(statName: "2-3 hours", statValue: "4"),
            Row(statName: "3-5 hours", statValue: "5"),
        ])
        let section_surface = Section(sectionName: "Surface", values: [
            Row(statName: "Road", statValue: "1"),
            Row(statName: "Mixed", statValue: "2"),
            Row(statName: "Trail", statValue: "3"),
            Row(statName: "Beach", statValue: "4"),
            Row(statName: "Wilderness", statValue: "5"),
        ])
        let section_weather = Section(sectionName: "Weather", values: [
            Row(statName: "Sunny", statValue: "1"),
            Row(statName: "Cloudy", statValue: "2"),
            Row(statName: "Rainy", statValue: "3"),
            Row(statName: "Snowy", statValue: "4"),
            Row(statName: "Night", statValue: "5"),
        ])
        let section_mood = Section(sectionName: "Mood", values: [
            Row(statName: "Awesome", statValue: "1"),
            Row(statName: "Good", statValue: "2"),
            Row(statName: "So-So", statValue: "3"),
            Row(statName: "Sluggish", statValue: "4"),
            Row(statName: "Injured", statValue: "5"),
        ])
        let section_location = Section(sectionName: "Location", values: [
            Row(statName: "Belfast", statValue: "1"),
            Row(statName: "Nottensdorf", statValue: "2"),
            Row(statName: "Buxtehude", statValue: "3"),
            Row(statName: "Fleetwood", statValue: "4"),
            Row(statName: "Scheidholz", statValue: "5"),
            Row(statName: "Bo'ness", statValue: "1"),
            Row(statName: "Wedel", statValue: "2"),
            Row(statName: "Hahnenbalken", statValue: "3"),
            Row(statName: "Cleveleys", statValue: "4"),
            Row(statName: "Marston", statValue: "5"),
            Row(statName: "Caton", statValue: "1"),
            Row(statName: "Littleborough", statValue: "2"),
            Row(statName: "Daestorf", statValue: "3"),
            Row(statName: "Thornton-Cleveleys", statValue: "4"),
            Row(statName: "Ripponden", statValue: "5"),
            Row(statName: "Rivington", statValue: "1"),
            Row(statName: "Sankt Georg", statValue: "2"),
            Row(statName: "Niederhaverbeck", statValue: "3"),
            Row(statName: "Marizion", statValue: "4"),
            Row(statName: "Par", statValue: "5"),
            Row(statName: "Chipping", statValue: "1"),
            Row(statName: "Goosnargh", statValue: "2"),
            Row(statName: "Barton", statValue: "3"),
            Row(statName: "Lostwithiel", statValue: "4"),
            Row(statName: "Hamburg-Mitte", statValue: "5"),
            Row(statName: "Saddleworth", statValue: "1"),
            Row(statName: "Bergedorf", statValue: "2"),
            Row(statName: "Mittelnkirchen", statValue: "3"),
            Row(statName: "Bodmin", statValue: "4"),
            Row(statName: "Tywardreath", statValue: "5"),
            Row(statName: "Great Marton", statValue: "1"),
            Row(statName: "Mawgan Porth", statValue: "2"),
            Row(statName: "Drochtersen", statValue: "3"),
            Row(statName: "Bassenfleth", statValue: "4"),
            Row(statName: "Saint Dennis", statValue: "5"),
            Row(statName: "Weaverham", statValue: "1"),
            Row(statName: "Alderley Edge", statValue: "2"),
            Row(statName: "Timperley", statValue: "3"),
            Row(statName: "Rochdale", statValue: "4"),
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
