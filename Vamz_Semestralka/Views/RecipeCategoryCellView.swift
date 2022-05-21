//
//  RecipeCategoryCellView.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import SwiftUI

struct RecipeCategoryCellView: View {
    let recipeCategory: RecipeCategoryViewModel
    var body: some View {
        HStack(spacing: 20){
            Text(recipeCategory.title)
        }
    }
}
