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
    var recipeCategory = String()
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let foodRecipeCell = UINib.init(nibName: "FoodRecipeCell", bundle: nil)
        self.tableView.register(foodRecipeCell, forCellReuseIdentifier: "FoodRecipeCell")
        let headerView = UINib.init(nibName: "HeaderView", bundle: nil)
        self.tableView.register(headerView, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.reloadData()
    }
    
    func loadRecipes(_ name: String) {
        RequestManager.shared.getRecipeData(for: name) {[weak self] response in
           
            guard let self = self else {return}
            switch response{
            case .success(let recipeData):
                for recipe in recipeData.recipes {
                    self.recipes.append(recipe)
                }
            case .failure(let error):
                print(error)
            }
            self.recipeCategory = name
            self.tableView.reloadData()
        }
    }
    func chooseImage(_ index: Int) -> String{
        
        var imageUrl: String
        switch (recipeCategory) {
            
        case "Chicken" :
            imageUrl = Constants.FoodImages.chickenImages[index % 5]
            break
        case "Pizza" :
            imageUrl = Constants.FoodImages.pizzaImages[index % 5]
            break
        case "Breakfast" :
            imageUrl = Constants.FoodImages.breakFastImages[index % 5]
            break
        case "Bacon" :
            imageUrl = Constants.FoodImages.baconImages[index % 5]
            break
        case "Steak" :
            imageUrl = Constants.FoodImages.steakImages[index % 5]
            break
        case "Indian" :
            imageUrl = Constants.FoodImages.indianImages[index % 5]
            break
            
        default:
            imageUrl = Constants.FoodImages.asianImages[index % 5]
            break
        }
        
        return imageUrl
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
        cell.typeLabel.text = recipes[indexPath.row].id
        let imageName = chooseImage(indexPath.row)
        cell.imageV.loadFrom(URLAddress: imageName)
        
        return cell
        }
    
}

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
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
