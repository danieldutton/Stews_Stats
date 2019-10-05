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
    
    @IBOutlet weak var lbl_1: UILabel!
    @IBOutlet weak var lbl_2: UILabel!
    @IBOutlet weak var lbl_3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelPlaceholderText()
        displaySavedData()
        sizeLabelsToFit()
    }
    
    private func setLabelPlaceholderText() {
        let placeHolderText = "--"
        
        lbl_1.text = placeHolderText
        lbl_2.text = placeHolderText
        lbl_3.text = placeHolderText
    }
    
    private func displayDataOnWidget(){
        let data = fetchDataToDisplay()
    }
    
    private func displaySavedData() {
        let persistance = Persistance.shared
        let results = persistance.retrievePersistedData(.one)
        lbl_1.text = results?.first?.name ?? "No Value"
    }
    
    private func sizeLabelsToFit() {
        lbl_1.sizeToFit()
        lbl_2.sizeToFit()
        lbl_3.sizeToFit()
    }

    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
}

