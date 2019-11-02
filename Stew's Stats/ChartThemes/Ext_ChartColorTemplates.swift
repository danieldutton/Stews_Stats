import Charts
import CoreGraphics

extension ChartColorTemplates {
    
    static func stewsStatsColourful() -> [NSUIColor] {
        let divisor: CGFloat  = 255.0
        let alpha: CGFloat = 1.0
        
        let colors: [NSUIColor] = [
            NSUIColor(red: 223.0/divisor, green: 52.0/divisor, blue: 46.0/divisor, alpha: alpha),
            NSUIColor(red: 44.0/divisor, green: 197.0/divisor, blue: 94.0/divisor, alpha: alpha),
            NSUIColor(red: 43.0/divisor, green: 132.0/divisor, blue: 210.0/divisor, alpha: alpha),
            NSUIColor(red: 237.0/divisor, green: 186.0/divisor, blue: 16.0/divisor, alpha: alpha),
            NSUIColor.orange,
        ]
        return colors
    }
}
