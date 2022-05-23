//
//  FoodViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 05/05/2022.
//

import UIKit
import SwiftUI

class FoodViewController: UIViewController{

    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var recipes = [Recipe]()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.delegate = self
        tableView.dataSource = self
                
        let foodRecipeCell = UINib.init(nibName: "FoodRecipeCell", bundle: nil)
        self.tableView.register(foodRecipeCell, forCellReuseIdentifier: "FoodRecipeCell")
        let headerView = UINib.init(nibName: "HeaderView", bundle: nil)
        self.tableView.register(headerView, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
}


// MARK: - TableView data source 
extension FoodViewController: UITableViewDataSource, UITableViewDelegate {
    
  

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.headerLabel.text = "Food"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FoodRecipeCell", for: indexPath) as! FoodRecipeCell
        cell.textField.text = recipes[indexPath.row].title
        return cell
        }
    
}
