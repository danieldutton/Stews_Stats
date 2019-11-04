import Foundation

class DailyActivityStatisticsSeedData: ActivitySeedData {
    
    func getSeedData() -> [TableViewSection] {
        let section_distance = TableViewSection(name: "Distance", rows: [
            TableViewRow(stat1: "1-5 miles", stat2: "323"),
            TableViewRow(stat1: "5-10 miles", stat2: "913"),
            TableViewRow(stat1: "10-15 miles", stat2: "117"),
            TableViewRow(stat1: "15-20 miles", stat2: "1"),
            TableViewRow(stat1: "20-30 miles", stat2: "0"),
        ])
        let section_duration = TableViewSection(name: "Duration", rows: [
            TableViewRow(stat1: "< 30 mins", stat2: "21"),
            TableViewRow(stat1: "30-60 mins", stat2: "59"),
            TableViewRow(stat1: "1-2 hours", stat2: "662"),
            TableViewRow(stat1: "2-3 hours", stat2: "488"),
            TableViewRow(stat1: "3-5 hours", stat2: "125"),
        ])
        let section_surface = TableViewSection(name: "Surface", rows: [
            TableViewRow(stat1: "Road", stat2: "43"),
            TableViewRow(stat1: "Mixed", stat2: "190"),
            TableViewRow(stat1: "Trail", stat2: "324"),
            TableViewRow(stat1: "Beach", stat2: "786"),
            TableViewRow(stat1: "Wilderness", stat2: "11"),
        ])
        let section_weather = TableViewSection(name: "Weather", rows: [
            TableViewRow(stat1: "Sunny", stat2: "449"),
            TableViewRow(stat1: "Cloudy", stat2: "629"),
            TableViewRow(stat1: "Rainy", stat2: "208"),
            TableViewRow(stat1: "Snowy", stat2: "13"),
            TableViewRow(stat1: "Night", stat2: "55"),
        ])
        let section_mood = TableViewSection(name: "Mood", rows: [
            TableViewRow(stat1: "Awesome", stat2: "417"),
            TableViewRow(stat1: "Good", stat2: "626"),
            TableViewRow(stat1: "So-So", stat2: "199"),
            TableViewRow(stat1: "Sluggish", stat2: "90"),
            TableViewRow(stat1: "Injured", stat2: "22"),
        ])
        let section_location = TableViewSection(name: "Location", rows: [
            TableViewRow(stat1: "Fleetwood", stat2: "743"),
            TableViewRow(stat1: "Scheidholz", stat2: "112"),
            TableViewRow(stat1: "Cleveleys", stat2: "104"),
            TableViewRow(stat1: "Nottensdorf", stat2: "87"),
            TableViewRow(stat1: "Littleborough", stat2: "46"),
            TableViewRow(stat1: "Buxtehude", stat2: "44"),
            TableViewRow(stat1: "Daestorf", stat2: "33"),
            TableViewRow(stat1: "Belfast", stat2: "32"),
            TableViewRow(stat1: "Rochdale", stat2: "30"),
            TableViewRow(stat1: "Thornton", stat2: "16"),
            TableViewRow(stat1: "Ripponden", stat2: "15"),
            TableViewRow(stat1: "Chipping", stat2: "11"),
            TableViewRow(stat1: "Barton", stat2: "11"),
            TableViewRow(stat1: "Bo'ness", stat2: "10"),
            TableViewRow(stat1: "Saddleworth", stat2: "7"),
            TableViewRow(stat1: "Goosnargh", stat2: "7"),
            TableViewRow(stat1: "Great Marton", stat2: "6"),
            TableViewRow(stat1: "Hahnenbalken", stat2: "5"),
            TableViewRow(stat1: "Par", stat2: "4"),
            TableViewRow(stat1: "Rivington", stat2: "4"),
            TableViewRow(stat1: "Mittelnkirchen", stat2: "3"),
            TableViewRow(stat1: "Rudheath", stat2: "2"),
            TableViewRow(stat1: "Sankt Georg", stat2: "2"),
            TableViewRow(stat1: "Bassenfleth", stat2: "2"),
            TableViewRow(stat1: "Tywardreath", stat2: "2"),
            TableViewRow(stat1: "Bodmin", stat2: "2"),
            TableViewRow(stat1: "Altona", stat2: "1"),
            TableViewRow(stat1: "Wedel", stat2: "1"),
            TableViewRow(stat1: "Niederhaverbeck", stat2: "1"),
            TableViewRow(stat1: "Hamburg-Mitte", stat2: "1"),
            TableViewRow(stat1: "Bergedorf", stat2: "1"),
            TableViewRow(stat1: "Drochtersen", stat2: "1"),
            TableViewRow(stat1: "Marston", stat2: "1"),
            TableViewRow(stat1: "Caton", stat2: "1"),
            TableViewRow(stat1: "Marizion", stat2: "1"),
            TableViewRow(stat1: "Lostwithiel", stat2: "1"),
            TableViewRow(stat1: "Mawgan Porth", stat2: "1"),
            TableViewRow(stat1: "Saint Dennis", stat2: "1"),
            TableViewRow(stat1: "Alderley Edge", stat2: "1"),
            TableViewRow(stat1: "Timperley", stat2: "1"),
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
