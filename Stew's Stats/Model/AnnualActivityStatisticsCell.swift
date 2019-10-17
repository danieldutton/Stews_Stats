//
//  AnnualActivityStatisticsCell.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 01/10/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class AnnualActivityStatisticsCell: UITableViewCell {
    
    @IBOutlet weak var txtFieldAnnualActivities: UITextField!
    
    @IBOutlet weak var txtFieldAnnualMiles: UITextField!
    
    override func didTransition(to state: UITableViewCell.StateMask) {
        self.txtFieldAnnualActivities.isEnabled = state.contains(.showingEditControl)
        self.txtFieldAnnualMiles.isEnabled = state.contains(.showingEditControl)
        
        super.didTransition(to: state)
    }

}
