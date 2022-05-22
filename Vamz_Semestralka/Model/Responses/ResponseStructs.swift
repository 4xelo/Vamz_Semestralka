//
//  RecipeCategoryResponse.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import Foundation

// MARK: - RecipeCategoryResponse
struct RecipeCategoryResponse: Decodable {
    let categories: [RecipeCategory]
}

// MARK: - RecipeCategory
struct RecipeCategory: Decodable {
    let title: String
}

// MARK: - RecipeResponse
struct RecipeResponse: Codable {
    let count: Int
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Codable {
    let imageURL: String
    let socialURL: Double
    let publisher: String
    let sourceURL: String
    let id: String
    let publishedID: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case socialURL = "socialUrl"
        case publisher
        case sourceURL = "sourceUrl"
        case id
        case publishedID = "publishedId"
        case title
    }
}
