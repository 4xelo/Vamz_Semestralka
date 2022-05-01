//
//  HomeTableViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 30/04/2022.
//

enum CellSection: Int {
    case featured = 0
    case latest = 1
}


import UIKit

class HomeTableViewController: UITableViewController{
  
    let sections = ["FEATURED RECIPES", "LATEST"]
    let items = [["Pasta"],["Chicken Breast","Pasta" , "Spagethi", "Risoto"]]
    override func viewDidLoad() {
        super.viewDidLoad()

        let recipeCell = UINib.init(nibName: "RecipeCell", bundle: nil)
        self.tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
        let featureCell = UINib.init(nibName: "FeatureCell", bundle: nil)
        self.tableView.register(featureCell, forCellReuseIdentifier: "FeatureCell")
        let headerView = UINib.init(nibName: "HeaderView", bundle: nil)
        self.tableView.register(headerView, forHeaderFooterViewReuseIdentifier: "HeaderView")
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
   
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let featureCell = cell as? FeatureCell
        featureCell?.collectionView.delegate = self
        featureCell?.collectionView.dataSource = self
        
        let collectionViewNib = UINib.init(nibName: "FeaturedCollectionViewCell", bundle: nil)
        featureCell?.collectionView.register(collectionViewNib, forCellWithReuseIdentifier: "CollectionCell")
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.headerLabel.text = sections[section]
        return headerView
    }
}
extension HomeTableViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! FeaturedCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 250, height: 120)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
}

