//
//  SListViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import UIKit

class SListViewController: UIViewController  {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    var lists = [String]()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shopping List"
        ShopListManager.shared.loadItems() {
            refreshTableView()
        }
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    private func refreshTableView() {
        self.lists = ShopListManager.shared.shoppingItemsList
        self.tableView.reloadData()
    }

    
    // MARK: - Action
    @IBAction func didTapAdd(_ sender: Any) {

        let alert = UIAlertController(title: "New Item", message: "Enter new shopping item", preferredStyle: .alert)
        alert.addTextField{ field in
            field.placeholder = "Enter item..."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    ShopListManager.shared.addItem(String: text) {
                        self?.lists.append(text)
                        self?.tableView.reloadData()
                    }
                }
            }
        }))
        present(alert,animated: true)
    }
}


// MARK: - TableView data source
extension SListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = lists[indexPath.row]
        
        return cell
    }
    
}

// MARK: - TableView delegate
extension SListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ShopListManager.shared.removeItem(at: indexPath.row) {
                refreshTableView()
            }
        }
    }

    
}

