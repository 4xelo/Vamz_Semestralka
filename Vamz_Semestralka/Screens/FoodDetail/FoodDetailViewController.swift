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
    @IBOutlet weak var ingredientsTextField: UITextField!
    
    
    var foodDetailData = [FoodDetail]()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food Detail"
        
    }
    //MARK: - Food detail loading
    func loadFoodDetail(_ id : String) {
        RequestManager.shared.getFoodDetailData(for: id) { [weak self] response in
            var text = """
                    """
            
            guard let self = self else { return }
            self.foodDetailData.removeAll()
            switch response {
            case .success(let foodData):
                self.titleLabel.text = foodData.recipe.title
                self.publisherLabel.text = foodData.recipe.publisher
                for item in foodData.recipe.ingredients {
                    text.append(item + "\n")
                }
                self.ingredientsTextField.text = text
                //print(foodData.recipe.ingredients)
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}
