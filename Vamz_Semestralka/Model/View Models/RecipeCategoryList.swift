//
//  RecipeCategoryList.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import Foundation

class RecipeCategoryListViewModel: ObservableObject {
    
    var recipeCategories = [RecipeCategoryViewModel]()
    func populateCategories() async {
        
        do{
            
            let recipeCategoryResponse = try await WebService().get(url: Constants.Urls.recipeCategoryURL){
                data in
                return try? JSONDecoder().decode(RecipeCategoryResponse.self, from: data)
            }
            self.recipeCategories = recipeCategoryResponse.categories.map(RecipeCategoryViewModel.init)
            
        }catch{
            print(error)
        }
    }
}

struct RecipeCategoryViewModel: Identifiable {
    
    let id = UUID()
    private let recipeCategory: RecipeCategory
    
    init(_ recipeCategory: RecipeCategory) {
        self.recipeCategory = recipeCategory
    }
    var title: String {
        recipeCategory.title
    }
    
}
