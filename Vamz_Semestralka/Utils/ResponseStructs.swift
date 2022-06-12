//
//  RecipeCategoryResponse.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import Foundation


// MARK: - CategoryResponse
struct CategoryResponse: Codable {
    let categories: [Category]
}


// MARK: - Category
struct Category: Codable {
    let title: String
}


// MARK: - RecipeResponse
struct RecipeResponse: Codable {
    let recipes: [Recipe]
}


// MARK: - Recipe
struct Recipe: Codable {
    let imageURL: String
    let id: String
    let title: String
    
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case id
        case title
    }
}

// MARK: - FoodDetailResponse
struct FoodDetailResponse: Codable {
    let recipe: FoodDetail
}

// MARK: - FoodDetail
struct FoodDetail: Codable {
    let ingredients : [String]
        let id: String
        let publisher: String
        let title: String
        

        enum CodingKeys: String, CodingKey {
            case id = "recipe_id"
            case publisher,title,ingredients
        }
}
