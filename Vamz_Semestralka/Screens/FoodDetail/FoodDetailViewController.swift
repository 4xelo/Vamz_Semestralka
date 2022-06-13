//
//  FoodDetailViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var FoodTableView: UITableView!
    
    
    var ingredients = [String]()
    var foodDetailData = [FoodDetail]()
    
    
    // MARK: - Lifecycle
    /// Metoda je volana po tom, ako sa nacita view z viewControllera, v metode sa nastavi tableView
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food Detail"
        FoodTableView.delegate = self
        FoodTableView.dataSource = self
        
    }
    //MARK: - Food detail loading
    /// Metoda nacita detail jedla z api.
    /// - Parameter id: Id jedla, ktore sa ma zobrazit.
    func loadFoodDetail(_ id : String) {
        RequestManager.shared.getFoodDetailData(for: id) { [weak self] response in
            
            
            guard let self = self else { return }
            self.foodDetailData.removeAll()
            switch response {
            case .success(let foodData):
                self.titleLabel.text = foodData.recipe.title
                self.publisherLabel.text = foodData.recipe.publisher
                for item in foodData.recipe.ingredients {
                    self.ingredients.append(item)
                }
            case .failure(let error):
                print(error)
            }
            self.FoodTableView.reloadData()
        }
    }
}
extension FoodDetailViewController : UITableViewDelegate {
    
    
}
extension FoodDetailViewController: UITableViewDataSource {
    /// Metoda vracia pocet riadkov
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - section: Index sekcie.
    /// - Returns: pocet riadkov
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    /// Metoda si od zdroja pyta cellu, s zamerom aby ju mohla umiestnit na urcite miesto v tableView.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    /// - Returns: Objekt, ktory dedi z UITableViewCell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCell", for: indexPath) as! IngredientsViewCell
        
        cell.ingredientsLabel.text = ingredients[indexPath.row]
        return cell
    }
    
}
