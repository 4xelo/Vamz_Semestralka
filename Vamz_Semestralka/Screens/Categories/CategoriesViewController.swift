//
//  CategoriesViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 04/05/2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    let categories = ["BEVERAGE","BREAD","BREAKFAST","BRUNCH","BURGER","DESSERT","DINNER","DRINK","FISH","FRIED",
                      "KEBAB","MAIN DISH","MARINADE","MEAT","OMELETTE","PASTA", "PIE","PIZZA","SALAD","SANDWICH",
                      "SAUCE","SIDE DISH","SNACK","SOUP","VEGAN"]
    
    var searchCategory = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

    // MARK: - Table view data source

    
    extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource{
        func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            
            return 1
            
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            if searching {
                return searchCategory.count
                
            } else
            {
                return categories.count
                
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            
            if searching {
                cell.categoryLabel.text = searchCategory[indexPath.row]
            }else {
                
                cell.categoryLabel.text = categories[indexPath.row]
            }
            return cell
        
        }
    }
extension CategoriesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCategory = categories.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
    
