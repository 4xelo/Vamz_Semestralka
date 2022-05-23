//
//  FavoritesTableViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 01/05/2022.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    //MARK: - Variables
    let items = [String]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipeCell = UINib.init(nibName: "RecipeCell", bundle: nil)
        tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        return cell
    }


}
