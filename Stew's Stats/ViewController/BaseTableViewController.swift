//
//  BaseTableViewController.swift
//  Stew's Stats
//
//  Created by Daniel Dutton on 09/10/2019.
//  Copyright © 2019 Daniel Dutton. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController: UITableViewController {
    
    internal var sections: [Section] = []
    
    internal var persistance = Persistance.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEditButtonItemToRightOfNavBar()
    }
    
    internal func addEditButtonItemToRightOfNavBar() {
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    internal func seedTableViewIfEmpty(_ key: UserPrefsKey, seedData: SeedData) {
        if let persistedData = persistance.retrievePersistedData(key) {
            sections = persistedData
        } else {
            sections = seedData.getSeedData()
            persistance.persistUserData(tableViewData: sections, with: key)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].name
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == sections.count - 1 {
            let rows = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            if rows - 1 == indexPath.row {
                return .insert
            }
        }
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
