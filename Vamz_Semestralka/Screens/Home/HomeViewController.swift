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
    let sections = ["LATEST"]
    var items = [Latest]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        HistoryManager.shared.loadItems() {
            refreshTableView()
        }
        
        let recipeCell = UINib.init(nibName: "RecipeCell", bundle: nil)
        self.tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
        
        let headerView = UINib.init(nibName: "HeaderView", bundle: nil)
        self.tableView.register(headerView, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.reloadData()
       
    }
    
    private func refreshTableView() {
        self.items = HistoryManager.shared.historyItemsList
        self.tableView.reloadData()
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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        cell.foodImage.loadImage(URLAddress: items[indexPath.row].imageUrl)
        cell.servingsLabel.text = "\(items[indexPath.row].servingsCount) ks"
        cell.timeLabel.text = "\(items[indexPath.row].time) min"
        cell.difficultyLabel.text = items[indexPath.row].difficulty
        cell.foodNameLabel.text = items[indexPath.row].category
        return cell
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        items = HistoryManager.shared.historyItemsList
        print(items)
        tableView.reloadData()
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - indexPath: <#indexPath description#>
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "FoodDetailViewController", bundle: nil)
        if let foodDetailViewController = storyboard.instantiateInitialViewController() as? FoodDetailViewController {
            foodDetailViewController.loadFoodDetail(items[indexPath.row].id)
            navigationController?.pushViewController(foodDetailViewController, animated: true)
        }
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - section: <#section description#>
    /// - Returns: <#description#>
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.headerLabel.text = sections[section]
        return headerView
    }
}

extension UIImageView {
    
    func loadImage(URLAddress: String) {
        guard let url = URL(string: URLAddress) else { return }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
