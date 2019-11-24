import Charts
import UIKit

//what about extending from table view controller
class DailyActivityPieChartController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    private var statistics: Statistics!

    private var statsRepo = StatisticsRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        try! self.statistics = statsRepo.getStatistics(.daily)

        displayPieChartFor(section: tabBarController!.selectedIndex)
    }
    
    private func displayPieChartFor(section: Int)  {
        pieChartView.clear()
        attachPieChartDataFor(section: section)
        stylePieChart()
        displayPieChart()
    }
    
    private func attachPieChartDataFor(section: Int) {
        let data = PieChartData(dataSet: generateChartDataEntries(section))
        
        data.setValueFormatter(NumberFormatter.percentageFormatter)
        pieChartView.data = data
    }
    
    private func generateChartDataEntries(_ section: Int) -> PieChartDataSet {
        let chartLabels = statistics.sections[section].rows.map {
            $0.stat1
        }
        let chartValues = statistics.sections[section].rows.map{
            Double($0.stat2)!
        }
        
        var entries = [PieChartDataEntry]()
        
        for (index, value) in chartValues.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = chartLabels[index]
            entries.append(entry)
        }
        return PieChartDataSet(entries)
    }
    
    private func stylePieChart() {
        pieChartView.transparentCircleColor = UIColor.clear
        pieChartView.holeRadiusPercent = 0.2
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.usePercentValuesEnabled = true
        pieChartView.noDataText = "Not enough data to construct a Pie Chart"
        pieChartView.isUserInteractionEnabled = true
        
        pieChartView.animate(yAxisDuration: 0.5, easingOption: .linear)
    }
    
    private func displayPieChart() {
        view.addSubview(pieChartView)
    }
}
