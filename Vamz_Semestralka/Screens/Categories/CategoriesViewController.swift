//
//  CategoriesViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 04/05/2022.
//

import UIKit
import SwiftUI
enum FoodID: String {
    case bread = "f391295034a35ce87466125f5300ad7d"
    case breakfast = "0a8f22f788b83618191d51dbe89f8a81"
    case brunch = "ae02ca9df0a5192fa670cedbcda7a0fe"
    case burger = "267a5f0628febb475ef88ec33fa25606"
    case dessert = "6a88c031da2da0ed355ca62bdedf4f65"
    case dinner = "ec1766cc49469827cdc940123a4d3d82"
    case fish = "40f32cfd109eeae57aad1a43a678a891"
    case fried = "2e83188ff059b63438053b76a8a5d753"
    case kebab = "b754709b07521a6fb8de1ee6b445b023"
    case mainDish = "cae309707fbdc7eb1b5b5a2bafe97a18"
    case marinade = "2404465c9ca8995290bc5cdaee191bfe"
    case meat = "6d86591aaf8f4923910d3c051fe343d4"
    case omelette = "469806ac8682ac153248223859dfd711"
    case pasta = "e0d6d517725e73ca977a1875f5841504"
    case pie = "b59889e5cf55099d146e6ae764f20123"
    case pizza = "f2735ab17a0c61d8f9a4ad7743a8057e"
    case salad = "0ec48df32629a4349a37af0fed9a6835"
    case sandwich = "b5f6ca361eb69838c8dabcdbe1221686"
    case spaghetti = "34936912c5da5e8e2738e9be37d90739"
    case sideDish = "1070d5c8832fdcd6ddba69c80d14d2eb"
    case snack = "94d93ae11a7e0f639e0e8d860768888c"
    case soup = "7ba18d553b4b4e1c451cb005dfa3d673"
    case vegan = "9a38d0da7e9d290f54bd8850d28e9b24"
}


let categories = ["BREAD","BREAKFAST","BRUNCH","BURGER","DESSERT","DINNER","FISH","FRIED",
                  "KEBAB","MAIN DISH","MARINADE","MEAT","OMELETTE","PASTA", "PIE","PIZZA","SALAD","SANDWICH",
                  "SAUCE","SPAGHETTI","SIDE DISH","SNACK","SOUP","VEGAN"]
class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
      
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
            return 1
            
        }
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
                cell.categoryLabel.text = searchCategory[indexPath.row]
            }
            else {
                cell.categoryLabel.text = categories[indexPath.row]
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Void{
            _ = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            
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

