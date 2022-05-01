//
//  FavoritesTableViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 01/05/2022.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    let items = ["pasta","pasta","pasta","pasta"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipeCell = UINib.init(nibName: "RecipeCell", bundle: nil)
        tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        
        return cell
    }


}
