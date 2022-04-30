//
//  RecipeCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 30/04/2022.
//

import UIKit

class RecipeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none//neoznaci cellu
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
