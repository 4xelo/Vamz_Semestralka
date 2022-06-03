//
//  CategoriesViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 04/05/2022.
//

import UIKit
import SwiftUI




class CategoriesViewController: UIViewController, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Variables
    var categories = [Category]()
    var searchCategory = [Category]()
    var searching = false
    
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        populateCategory()
       
    }
    
    //MARK: - Naplnenie Categories
    func populateCategory(){
        RequestManager.shared.getCategoryData(){ [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(let categoryData):
                for category in categoryData.categories {
                    self.categories.append(category)
                }
            case .failure(let error):
                print(error)
            }
            self.tableView.reloadData()
        }
    }
    
    
    
}

    // MARK: - Table view data source

    extension CategoriesViewController: UITableViewDataSource{
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
                cell.categoryLabel.text = searchCategory[indexPath.row].title
            }
            else {
                cell.categoryLabel.text = categories[indexPath.row].title
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let text = categories[indexPath.row].title
    
            let storyboard = UIStoryboard(name: "FoodViewController", bundle: nil)
            if let foodNavigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
                let foodViewController = foodNavigationController.topViewController as? FoodViewController
                {
                foodViewController.loadRecipes(text)
                foodViewController.title = text
                present(foodNavigationController, animated: true)
                
                }
    }
}
    //MARK: - Category Search
extension CategoriesViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCategory = categories.filter({$0.title.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

