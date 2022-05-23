//
//  RecipeCategoryResponse.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import Foundation


// MARK: - CategoryResponse
struct CategoryResponse: Decodable {
    let categories: [Category]
}


// MARK: - Category
struct Category: Decodable {
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
