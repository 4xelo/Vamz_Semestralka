//
//  CategoryManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import Foundation


class RecipeManager {
    
    // MARK: - Variables
    static let shared = RecipeManager()
    var recipeList = [Recipe]()
    
    
    func loadData(_ name: String) {
        RequestManager.shared.getRecipeData(for: name) { [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(let RecipeResponse):
                for recipe in RecipeResponse.recipes{
                    self.recipeList.append(recipe)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func printRecipes() {
        for recipe in recipeList {
            print(recipe)
        }
    }
}
