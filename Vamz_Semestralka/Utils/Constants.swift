//
//  Constants.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 20/05/2022.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        // MARK: - Category URL
        static let recipeCategoryURL = URL (string: "https://recipesapi.herokuapp.com/api/v2/categories")!
        
        // MARK: - Recipe URL
        static func recipeByCategoryName(_ name: String) -> URL {
            return URL(string: "https://recipesapi.herokuapp.com/api/v2/recipes?q=\(name)&page=1")!
        }
    }
}
