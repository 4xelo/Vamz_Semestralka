//
//  SListViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import UIKit

class SListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var lists = [String]()
    
    @IBAction func didTapAdd(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
//        vc.title = "New List"
//        vc.update = {
//            DispatchQueue.main.async {//prioritizujeme updatovanie
//                self.updateLists()
//            }
//        }
       // navigationController?.pushViewController(vc, animated: true)
        
        let alert = UIAlertController(title: "New Item", message: "Enter new shopping item", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Enter item..."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self]
            (_) in
            if let field = alert.textFields?.first {
                guard let text = field.text, !text.isEmpty else {
                    return
                }
                guard let count = UserDefaults.value(forKey: "count") as? Int else {
                    return
                }
                let newCount = count + 1
                
                UserDefaults().set(newCount, forKey: "count")
                UserDefaults().set(text, forKey: "list_\(newCount)")
                
                DispatchQueue.main.async {
                    self?.updateLists()
                }
                
            }
        }))
        present(alert,animated: true)
    }
    
    func updateLists() {
        lists.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for value in 0..<count {
            if let list = UserDefaults().value(forKey: "list_\(value + 1)") as? String {
                lists.append(list)
            }
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shopping List"
      
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true,forKey: "setup")
            UserDefaults().set(0,forKey: "count")
        }
        
        //GetSavedData
        self.updateLists()
    }

}

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
