//
//  PieChartController.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 19/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Charts
import UIKit

class PieChartController: UIViewController {

    var tableViewData: TableViewData = TableViewData()
    
    var persistance = Persistance()
    
    @IBOutlet weak var pieChartView: PieChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableViewData = persistance.retrievePersistedData()
        updateChartData(with: tabBarController!.selectedIndex)
    }
    
    func updateChartData(with section: Int)  {
        //remove the view already there.  are we overlaying views.  memory problems etc
        pieChartView.clear()
        // 2. generate chart data entries
        let statType = tableViewData.items[section]
        let statValue = tableViewData.data[section].map{Double($0)!}
        
        var entries = [PieChartDataEntry]()
        for (index, value) in statValue.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = statType[index]
            entries.append(entry)
        }
        
        // 3. chart setup
        let set = PieChartDataSet(entries: entries)
        pieChartView.drawEntryLabelsEnabled = false
        
        set.colors = ChartColorTemplates.material()
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
        
        let d = Description()
        
        pieChartView.chartDescription = d
        pieChartView.holeRadiusPercent = 0.2
        
        pieChartView.animate(yAxisDuration: 0.5,
        easingOption: .linear)
        
        pieChartView.transparentCircleColor = UIColor.clear
        
        //animation
        
        self.view.addSubview(pieChartView)
    }
}

