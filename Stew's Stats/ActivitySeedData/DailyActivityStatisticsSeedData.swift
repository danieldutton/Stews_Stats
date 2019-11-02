import Foundation

class DailyActivityStatisticsSeedData: ActivitySeedData {
    
    func getSeedData() -> [Section] {
        let section_distance = Section(name: "Distance", rows: [
            Row(stat1: "1-5 miles", stat2: "323"),
            Row(stat1: "5-10 miles", stat2: "913"),
            Row(stat1: "10-15 miles", stat2: "117"),
            Row(stat1: "15-20 miles", stat2: "1"),
            Row(stat1: "20-30 miles", stat2: "0"),
        ])
        let section_duration = Section(name: "Duration", rows: [
            Row(stat1: "< 30 mins", stat2: "21"),
            Row(stat1: "30-60 mins", stat2: "59"),
            Row(stat1: "1-2 hours", stat2: "662"),
            Row(stat1: "2-3 hours", stat2: "488"),
            Row(stat1: "3-5 hours", stat2: "125"),
        ])
        let section_surface = Section(name: "Surface", rows: [
            Row(stat1: "Road", stat2: "43"),
            Row(stat1: "Mixed", stat2: "190"),
            Row(stat1: "Trail", stat2: "324"),
            Row(stat1: "Beach", stat2: "786"),
            Row(stat1: "Wilderness", stat2: "11"),
        ])
        let section_weather = Section(name: "Weather", rows: [
            Row(stat1: "Sunny", stat2: "449"),
            Row(stat1: "Cloudy", stat2: "629"),
            Row(stat1: "Rainy", stat2: "208"),
            Row(stat1: "Snowy", stat2: "13"),
            Row(stat1: "Night", stat2: "55"),
        ])
        let section_mood = Section(name: "Mood", rows: [
            Row(stat1: "Awesome", stat2: "417"),
            Row(stat1: "Good", stat2: "626"),
            Row(stat1: "So-So", stat2: "199"),
            Row(stat1: "Sluggish", stat2: "90"),
            Row(stat1: "Injured", stat2: "22"),
        ])
        let section_location = Section(name: "Location", rows: [
            Row(stat1: "Fleetwood", stat2: "743"),
            Row(stat1: "Scheidholz", stat2: "112"),
            Row(stat1: "Cleveleys", stat2: "104"),
            Row(stat1: "Nottensdorf", stat2: "87"),
            Row(stat1: "Littleborough", stat2: "46"),
            Row(stat1: "Buxtehude", stat2: "44"),
            Row(stat1: "Daestorf", stat2: "33"),
            Row(stat1: "Belfast", stat2: "32"),
            Row(stat1: "Rochdale", stat2: "30"),
            Row(stat1: "Thornton", stat2: "16"),
            Row(stat1: "Ripponden", stat2: "15"),
            Row(stat1: "Chipping", stat2: "11"),
            Row(stat1: "Barton", stat2: "11"),
            Row(stat1: "Bo'ness", stat2: "10"),
            Row(stat1: "Saddleworth", stat2: "7"),
            Row(stat1: "Goosnargh", stat2: "7"),
            Row(stat1: "Great Marton", stat2: "6"),
            Row(stat1: "Hahnenbalken", stat2: "5"),
            Row(stat1: "Par", stat2: "4"),
            Row(stat1: "Rivington", stat2: "4"),
            Row(stat1: "Mittelnkirchen", stat2: "3"),
            Row(stat1: "Rudheath", stat2: "2"),
            Row(stat1: "Sankt Georg", stat2: "2"),
            Row(stat1: "Bassenfleth", stat2: "2"),
            Row(stat1: "Tywardreath", stat2: "2"),
            Row(stat1: "Bodmin", stat2: "2"),
            Row(stat1: "Altona", stat2: "1"),
            Row(stat1: "Wedel", stat2: "1"),
            Row(stat1: "Niederhaverbeck", stat2: "1"),
            Row(stat1: "Hamburg-Mitte", stat2: "1"),
            Row(stat1: "Bergedorf", stat2: "1"),
            Row(stat1: "Drochtersen", stat2: "1"),
            Row(stat1: "Marston", stat2: "1"),
            Row(stat1: "Caton", stat2: "1"),
            Row(stat1: "Marizion", stat2: "1"),
            Row(stat1: "Lostwithiel", stat2: "1"),
            Row(stat1: "Mawgan Porth", stat2: "1"),
            Row(stat1: "Saint Dennis", stat2: "1"),
            Row(stat1: "Alderley Edge", stat2: "1"),
            Row(stat1: "Timperley", stat2: "1"),
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
