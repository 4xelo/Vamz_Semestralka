//
//  FoodViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 05/05/2022.
//

import UIKit
import SwiftUI

/// Trieda ma na starosti UI elementy obrazovky FoodViewController.storyboard
class FoodViewController: UIViewController{
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var recipes = [Recipe]()
    var recipeCategory = String()
    //MARK: - Life cycle
    ///Metoda je volana po tom, ako sa nacita view z viewControllera, v metode sa nastavi
    ///tableView, tableViewCell a headerView
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
    
    //MARK: - Recipe loading
    /// Metoda nacita recepty z api.
    /// - Parameter name: nazov konkretnej kategorie, ktoru chceme nacitat
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
    
    //MARK: - Image
    /// Metoda vyberie obrazok, ktory sa ulozi, nakolko obrazky ktore taham z api su uz neni ulozene na povodnej stranke, tak som to musel takto obist.
    /// - Parameter index: pozicia obrazka.
    /// - Returns: vrati string s url daneho obrazka.
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
    
    /// Metoda vrati vysku ktoru by mal mat riadok v desatinnych cislach
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    /// - Returns: Nezapornu hodnotu s pohyblivou desatinnou ciarkou, ktora urcuje vysku ktoru by mal mat riadok.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    /// Metoda vracia pocet riadkov
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - section:  Index sekcie.
    /// - Returns: pocet riadkov
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    /// Poziada delegata o view, ktory sa ma zobrazit v hlavicke zadanej casti zobrazenia tabulky.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - section: Cislo sekcie obsahujuce zobrazenie hlavicky.
    /// - Returns: Objekt ktory dedi z UIViewu.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.headerLabel.text = "Food"
        return headerView
    }
    
    /// Metoda si od zdroja pyta cellu, s zamerom aby ju mohla umiestnit na urcite miesto v tableView.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    /// - Returns: Objekt, ktory dedi z UITableViewCell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "FoodRecipeCell", for: indexPath) as! FoodRecipeCell
        cell.nameLabel.text = recipes[indexPath.row].title
        cell.typeLabel.text = recipes[indexPath.row].id
        //cell.imageV.loadFrom(URLAddress: recipes[indexPath.row].imageURL)
        let imageName = chooseImage(indexPath.row)
        cell.imageV.loadFrom(URLAddress: imageName)
        
        return cell
        }
    
    /// Metoda po zakliknuti na konkretnu recept zobrazi storyboard FoodDetailViewControlleru.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = recipes[indexPath.row].id
        _ =  tableView.dequeueReusableCell(withIdentifier: "FoodRecipeCell", for: indexPath) as! FoodRecipeCell
        
        let countTime = Constants.RecipeThings.timeCount.count
        let countServ = Constants.RecipeThings.servingsCount.count
        let countDiff = Constants.RecipeThings.difficulty.count
        
        
        let time = Constants.RecipeThings.timeCount[indexPath.row % countTime]
        let servings = Constants.RecipeThings.servingsCount[indexPath.row % countServ]
        let difficulty = Constants.RecipeThings.difficulty[indexPath.row % countDiff]
        
        let item = Latest.init(image: chooseImage(indexPath.row),categoryP: recipeCategory, timeP: time,difficultyP: difficulty, servings: servings, idP: id)
        HistoryManager.shared.addItem(item)
        
        
        let storyboard = UIStoryboard(name: "FoodDetailViewController", bundle: nil)
        if let foodDetailViewController = storyboard.instantiateInitialViewController() as? FoodDetailViewController {
            foodDetailViewController.loadFoodDetail(id)
            navigationController?.pushViewController(foodDetailViewController, animated: true)
        }
    }
}

extension UIImageView {
    
    /// Metoda nacita obrazok zo zadanej URLAdresy.
    /// - Parameter URLAddress: string url adresy obrazka.
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
