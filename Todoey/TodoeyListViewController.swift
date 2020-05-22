//
//  ViewController.swift
//  Todoey
//
//  Created by Qrati Labs on 5/22/20.
//  Copyright © 2020 Qrati Labs. All rights reserved.
//

import UIKit

class TodoeyListViewController: UITableViewController {
    
    var itemArray: [Item] = []
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStatusBar(.lightContent)
        itemArray.append(Item(title: "Find Chiru", done: false))
        itemArray.append(Item(title: "Buy Mango", done: false))
        itemArray.append(Item(title: "Distroy Demons", done: false))
        if let items = defaults.array(forKey: "TodoeyListArray") as? [Item] {
            self.itemArray = items
        }
    }
    
    @IBAction func addButtonTask(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add NEw Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { [weak self] (action) in
            guard let `self` = self else { return }
            if !textField.text!.isEmpty {
                self.itemArray.append(Item(title: textField.text!, done: false))
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
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return cell
    }
    
    
    // MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
        let item = itemArray[indexPath.row]
//        cell?.accessoryType = cell?.accessoryType == .checkmark ? .none : .checkmark
        item.done = !item.done
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    

}

