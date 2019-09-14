//
//  TableViewCell.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 14/09/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblStat: UILabel!
    
    @IBOutlet weak var txtFieldStatValue: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
