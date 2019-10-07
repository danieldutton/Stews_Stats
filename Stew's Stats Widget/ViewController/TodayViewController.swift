//
//  TodayViewController.swift
//  Stew's Stats Widget
//
//  Created by Daniel Dutton on 04/10/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var lblYear1: UILabel!
    @IBOutlet weak var lblYear1ActivityCount: UILabel!
    @IBOutlet weak var lblYear1TotalMilesCount: UILabel!
    
    @IBOutlet weak var lblYear2: UILabel!
    @IBOutlet weak var lblYear2ActivityCount: UILabel!
    @IBOutlet weak var lblYear2TotalMilesCount: UILabel!
    
    let sectionTool = SectionTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displaySavedData()
    }

    private func displaySavedData() {
        //let persistance = Persistance.shared
        
        //think boundaries
        let sectionPair = sectionTool.getTwoSectionsDescByYear()
        
        lblYear1.text = sectionPair.one.name
        lblYear1.sizeToFit()
        
        lblYear1ActivityCount.text = sectionPair.one.rows[0].statName
        lblYear1ActivityCount.sizeToFit()
        
        lblYear1TotalMilesCount.text = sectionPair.one.rows[0].statValue
        lblYear1TotalMilesCount.sizeToFit()
        
        lblYear2.text = sectionPair.two.name
        lblYear2.sizeToFit()
        
        lblYear2ActivityCount.text = sectionPair.two.rows[0].statName
        lblYear2ActivityCount.sizeToFit()
        
        lblYear2TotalMilesCount.text = sectionPair.two.rows[0].statValue
        lblYear2TotalMilesCount.sizeToFit()
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        displaySavedData()
        
        completionHandler(NCUpdateResult.newData)
    }
}

