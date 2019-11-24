import Foundation
import Charts

extension NumberFormatter {
    static var percentageFormatter: DefaultValueFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        
        return DefaultValueFormatter(formatter: formatter)
    }
}
