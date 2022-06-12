//
//  LatestStruct.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 11/06/2022.
//

import Foundation

struct Latest: Codable {
    var id : String
    var imageUrl: String
    var category: String
    var time: Int
    var difficulty: String
    var servingsCount: Int
   
    
    init(image: String, categoryP : String, timeP: Int, difficultyP: String, servings: Int ,idP: String) {
        
        imageUrl = image
        category = categoryP
        time = timeP
        difficulty = difficultyP
        servingsCount = servings
        id = idP
    }
    
}
