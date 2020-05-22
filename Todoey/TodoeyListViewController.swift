//
//  ViewController.swift
//  Todoey
//
//  Created by Qrati Labs on 5/22/20.
//  Copyright © 2020 Qrati Labs. All rights reserved.
//

import UIKit

class TodoeyListViewController: UITableViewController {

    let itemArray = ["Find Chiru", "Buy Mango", "Distroy Demons"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStatusBar(.lightContent)
    }

    // MARK: TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoeyItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.accessoryType = .none
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return cell
    }
    
    
    // MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = cell?.accessoryType == .checkmark ? .none : .checkmark
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

