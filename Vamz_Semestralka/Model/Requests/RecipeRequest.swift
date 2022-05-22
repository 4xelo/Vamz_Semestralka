//
//  CategoryRequest.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import Foundation

struct RecipeRequest: Encodable{
    let name: String
    let page: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "q"
        case page = "page"
    }
    
}
