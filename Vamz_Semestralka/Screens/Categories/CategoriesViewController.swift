//
//  CategoriesViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 04/05/2022.
//

import UIKit
import SwiftUI


/// Trieda ma na starosti UI elementy obrazovky CategoriesViewController.storyboard
class CategoriesViewController: UIViewController, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Variables
    var categories = [Category]()
    var searchCategory = [Category]()
    var searching = false
    
    //MARK: - Lifecycles
    
    /// metoda je volana po tom, ako sa nacita view z viewControllera, v metode sa nastavi tableView
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        populateCategory()
       
    }
    //MARK: - Naplnenie Categories
    /// metoda naplni zoznam categories datami z api, alebo vypise chybu v pripade, ze sa api nenacitali
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
        
        
        /// Metoda vrati pocet riadkov podla toho ci sa zrovna vyhladava alebo nie.
        /// - Parameters:
        ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
        ///   - section: Index sekcie.
        /// - Returns: vrati pocet riadkov.
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searching {
                return searchCategory.count
            } else
            {
                return categories.count
            }
        }
        
        /// <#Description#>
        /// - Parameters:
        ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
        ///   - indexPath: Index sekcie.
        /// - Returns: <#description#>
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
        
        /// <#Description#>
        /// - Parameters:
        ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
        ///   - indexPath: Index sekcie.
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
    
    /// <#Description#>
    /// - Parameters:
    ///   - searchBar: <#searchBar description#>
    ///   - searchText: <#searchText description#>
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCategory = categories.filter({$0.title.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    /// <#Description#>
    /// - Parameter searchBar: <#searchBar description#>
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

