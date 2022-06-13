//
//  SListViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import UIKit

/// Trieda ma na starosti UI elementy obrazovky SListViewController.storyboard
class SListViewController: UIViewController  {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    var lists = [String]()
    
    
    // MARK: - Lifecycle
    /// Metoda je volana po tom, ako sa nacita view z viewControllera, v metode sa nastavi tableView a zoznam: lists
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shopping List"
        ShopListManager.shared.loadItems() {
            refreshTableView()
        }
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    /// Metoda priradi zoznamu lists prvky z UserDefaults: shoppingListItems a obnovi tableView.
    private func refreshTableView() {
        self.lists = ShopListManager.shared.shoppingItemsList
        self.tableView.reloadData()
    }

    
    // MARK: - Action
    ///   Metoda prida do UserDefaults novu polozku.
    /// - Parameter sender: Objekt volajuci tuto funkciu.
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
    /// Metoda vracia pocet riadkov.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - section: Index sekcie.
    /// - Returns: pocet riadkov.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    
    /// Metoda si od zdroja pyta cellu, s zamerom aby ju mohla umiestnit na urcite miesto v tableView.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    /// - Returns:  Objekt, ktory dedi z UITableViewCell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = lists[indexPath.row]
        
        return cell
    }
    
}

// MARK: - TableView delegate
extension SListViewController : UITableViewDelegate {
    /// Metoda vymaze prvok z userDefaults.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - editingStyle: Editovaci styl celly.
    ///   - indexPath: Index sekcie.
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

