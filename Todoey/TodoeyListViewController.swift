//
//  ViewController.swift
//  Todoey
//
//  Created by Qrati Labs on 5/22/20.
//  Copyright © 2020 Qrati Labs. All rights reserved.
//

import UIKit

class TodoeyListViewController: UITableViewController {
    
    var itemArray = ["Find Chiru", "Buy Mango", "Distroy Demons"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStatusBar(.lightContent)
        
        if let items = defaults.array(forKey: "TodoeyListArray") as? [String] {
            self.itemArray = items
        } 
    }
    
    @IBAction func addButtonTask(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add NEw Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { [weak self] (action) in
            guard let `self` = self else { return }
            if !textField.text!.isEmpty {
                self.itemArray.append(textField.text!)
                self.defaults.set(self.itemArray, forKey: "TodoeyListArray")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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

