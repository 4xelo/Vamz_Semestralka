//
//  RecipeCategoryListView.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import SwiftUI

struct RecipeCategoryListView: View {
    
    let categories: [RecipeCategoryViewModel]
    var body: some View {
        List(categories) {category in
        RecipeCategoryCellView(recipeCategory: category)
        }
    }
}

