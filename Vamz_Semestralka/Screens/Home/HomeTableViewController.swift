//
//  HomeTableViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 30/04/2022.
//

import UIKit

class HomeTableViewController: UITableViewController {

    let sections = ["FEATURED RECIPES", "LATEST"]
    let items = [["Pasta"],["Chicken Breast","Pasta" , "Spagethi", "Risoto"]]
    override func viewDidLoad() {
        super.viewDidLoad()

        let recipeCell = UINib.init(nibName: "RecipeCell", bundle: nil)
        self.tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
        let featureCell = UINib.init(nibName: "FeatureCell", bundle: nil)
        self.tableView.register(featureCell, forCellReuseIdentifier: "FeatureCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = CellSection(rawValue: indexPath.section) else { return 0 }
        // chcem mat rozne vysky pre selekcie, pouzivam guard let, ak sa mi nepodari pridat do sekcie indexPath tak vratim 0, akoby sa nevytvorila cella
        switch section {
        case .featured:
            return 160
        case .latest:
            return 260
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let section = CellSection(rawValue: indexPath.section) {
            switch section {
            case .featured:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath) as! FeatureCell
                return cell
            case .latest:
                let cell =  tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
                return cell
            }
        }
        return cell
    }
   

}
enum CellSection: Int {
    case featured = 0
    case latest = 1
}

