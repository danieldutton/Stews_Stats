//
//  DailyStatisticCell.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class DailyStatisticCell: UITableViewCell {

    @IBOutlet weak var lblStat: UILabel!
    
    @IBOutlet weak var txtFieldStatValue: UITextField!

    
    override func didTransition(to state: UITableViewCell.StateMask) {
        self.txtFieldStatValue.isEnabled = state.contains(.showingEditControl)
        self.txtFieldStatValue.layer.zPosition = 10
        
        super.didTransition(to: state)
    }
}
