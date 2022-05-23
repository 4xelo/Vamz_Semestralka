//
//  HomeTableViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 30/04/2022.
//

import UIKit

class HomeViewController: UIViewController{
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Dummy Variables
    let sections = ["FEATURED RECIPES", "LATEST"]
    let items = [["Pasta"],["Chicken Breast","Pasta" , "Spagethi", "Risoto"]]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let recipeCell = UINib.init(nibName: "RecipeCell", bundle: nil)
        self.tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
        
        let headerView = UINib.init(nibName: "HeaderView", bundle: nil)
        self.tableView.register(headerView, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
}

//MARK: - TavleView Data source
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.headerLabel.text = sections[section]
        return headerView
    }
   
}
