import Charts
import UIKit

class DailyActivityPieChartController: UIViewController {
    
    private var sections: [Section]!

    var persistance = StatisticsCacher()
    
    @IBOutlet weak var pieChartView: PieChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sections = persistance.retrievePersistedData(.dailySummary)

        updateChartData(with: tabBarController!.selectedIndex)
    }
    
    func updateChartData(with section: Int)  {
        //remove the view already there.  are we overlaying views.  memory problems etc
        pieChartView.clear()
        // 2. generate chart data entries
        let statType = sections[section].rows.map {$0.stat1}
        let statValue = sections[section].rows.map{Double($0.stat2)!}
        
        var entries = [PieChartDataEntry]()
        for (index, value) in statValue.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = statType[index]
            entries.append(entry)
        }
        
        // 3. chart setup
        let set = PieChartDataSet(entries)
        pieChartView.drawEntryLabelsEnabled = false

        set.colors = ChartColorTemplates.stewsStatsColourful()
        let data = PieChartData(dataSet: set)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        pieChartView.usePercentValuesEnabled = true
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        pieChartView.data = data
        pieChartView.noDataText = "Not enough data to construct a Pie Chart"
        // user interaction
        pieChartView.isUserInteractionEnabled = true
        pieChartView.holeRadiusPercent = 0.2
        
        pieChartView.animate(yAxisDuration: 0.5,
        easingOption: .linear)
        
        pieChartView.transparentCircleColor = UIColor.clear

        self.view.addSubview(pieChartView)
    }
}



