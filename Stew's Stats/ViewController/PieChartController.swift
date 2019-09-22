//
//  PieChartController.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 19/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Charts
import UIKit

class PieChartController: UIViewController, UITabBarControllerDelegate {
    //this needs to be dynamically pumped through
    var tableViewData: TableViewData = TableViewData()
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    
    var section = 0 

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        print(self.section)
        //view did load appears to be called once for each item click
        //but then once they are loaded they are not called again
        tabBarController?.delegate = self
        self.tabBarController?.selectedIndex = self.section
        self.section = tabBarController!.selectedIndex
        updateChartData()
    }
    
    func updateChartData()  {
        //remove the view already there.  are we overlaying views.  memory problems etc

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
        d.text = "Stew's Stats"
        
        pieChartView.chartDescription = d
        pieChartView.holeRadiusPercent = 0.2
        
        pieChartView.transparentCircleColor = UIColor.clear
        
        //animation
        
        self.view.addSubview(pieChartView)
    }
}

extension PieChartController {
    //this is only called if ew use the tab bar at the bottom
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //foo(index: tabBarController.selectedIndex)
        let nc = tabBarController.viewControllers![tabBarController.selectedIndex] as! UINavigationController
        let vc = nc.viewControllers[0] as! PieChartController
        vc.section = tabBarController.selectedIndex
        updateChartData()
        print("Selected Tab Bar Index:- \(tabBarController.selectedIndex)")
    }
}

