//
//  RecipeCategoryResponse.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import Foundation

// MARK: - FoodResponse
struct RecipeCategoryResponse: Decodable {
    let categories: [RecipeCategory]
}

// MARK: - Category
struct RecipeCategory: Decodable {
    let title: String

}
