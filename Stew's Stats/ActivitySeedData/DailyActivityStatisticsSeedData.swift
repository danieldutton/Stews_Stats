import Foundation

class DailyActivityStatisticsSeedData: ActivitySeedData {
    
    func getSeedData() -> [TableSection] {
        let section_distance = TableSection(name: "Distance", rows: [
            TableRow(stat1: "1-5 miles", stat2: "323"),
            TableRow(stat1: "5-10 miles", stat2: "913"),
            TableRow(stat1: "10-15 miles", stat2: "117"),
            TableRow(stat1: "15-20 miles", stat2: "1"),
            TableRow(stat1: "20-30 miles", stat2: "0"),
        ])
        let section_duration = TableSection(name: "Duration", rows: [
            TableRow(stat1: "< 30 mins", stat2: "21"),
            TableRow(stat1: "30-60 mins", stat2: "59"),
            TableRow(stat1: "1-2 hours", stat2: "662"),
            TableRow(stat1: "2-3 hours", stat2: "488"),
            TableRow(stat1: "3-5 hours", stat2: "125"),
        ])
        let section_surface = TableSection(name: "Surface", rows: [
            TableRow(stat1: "Road", stat2: "43"),
            TableRow(stat1: "Mixed", stat2: "190"),
            TableRow(stat1: "Trail", stat2: "324"),
            TableRow(stat1: "Beach", stat2: "786"),
            TableRow(stat1: "Wilderness", stat2: "11"),
        ])
        let section_weather = TableSection(name: "Weather", rows: [
            TableRow(stat1: "Sunny", stat2: "449"),
            TableRow(stat1: "Cloudy", stat2: "629"),
            TableRow(stat1: "Rainy", stat2: "208"),
            TableRow(stat1: "Snowy", stat2: "13"),
            TableRow(stat1: "Night", stat2: "55"),
        ])
        let section_mood = TableSection(name: "Mood", rows: [
            TableRow(stat1: "Awesome", stat2: "417"),
            TableRow(stat1: "Good", stat2: "626"),
            TableRow(stat1: "So-So", stat2: "199"),
            TableRow(stat1: "Sluggish", stat2: "90"),
            TableRow(stat1: "Injured", stat2: "22"),
        ])
        let section_location = TableSection(name: "Location", rows: [
            TableRow(stat1: "Fleetwood", stat2: "743"),
            TableRow(stat1: "Scheidholz", stat2: "112"),
            TableRow(stat1: "Cleveleys", stat2: "104"),
            TableRow(stat1: "Nottensdorf", stat2: "87"),
            TableRow(stat1: "Littleborough", stat2: "46"),
            TableRow(stat1: "Buxtehude", stat2: "44"),
            TableRow(stat1: "Daestorf", stat2: "33"),
            TableRow(stat1: "Belfast", stat2: "32"),
            TableRow(stat1: "Rochdale", stat2: "30"),
            TableRow(stat1: "Thornton", stat2: "16"),
            TableRow(stat1: "Ripponden", stat2: "15"),
            TableRow(stat1: "Chipping", stat2: "11"),
            TableRow(stat1: "Barton", stat2: "11"),
            TableRow(stat1: "Bo'ness", stat2: "10"),
            TableRow(stat1: "Saddleworth", stat2: "7"),
            TableRow(stat1: "Goosnargh", stat2: "7"),
            TableRow(stat1: "Great Marton", stat2: "6"),
            TableRow(stat1: "Hahnenbalken", stat2: "5"),
            TableRow(stat1: "Par", stat2: "4"),
            TableRow(stat1: "Rivington", stat2: "4"),
            TableRow(stat1: "Mittelnkirchen", stat2: "3"),
            TableRow(stat1: "Rudheath", stat2: "2"),
            TableRow(stat1: "Sankt Georg", stat2: "2"),
            TableRow(stat1: "Bassenfleth", stat2: "2"),
            TableRow(stat1: "Tywardreath", stat2: "2"),
            TableRow(stat1: "Bodmin", stat2: "2"),
            TableRow(stat1: "Altona", stat2: "1"),
            TableRow(stat1: "Wedel", stat2: "1"),
            TableRow(stat1: "Niederhaverbeck", stat2: "1"),
            TableRow(stat1: "Hamburg-Mitte", stat2: "1"),
            TableRow(stat1: "Bergedorf", stat2: "1"),
            TableRow(stat1: "Drochtersen", stat2: "1"),
            TableRow(stat1: "Marston", stat2: "1"),
            TableRow(stat1: "Caton", stat2: "1"),
            TableRow(stat1: "Marizion", stat2: "1"),
            TableRow(stat1: "Lostwithiel", stat2: "1"),
            TableRow(stat1: "Mawgan Porth", stat2: "1"),
            TableRow(stat1: "Saint Dennis", stat2: "1"),
            TableRow(stat1: "Alderley Edge", stat2: "1"),
            TableRow(stat1: "Timperley", stat2: "1"),
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
