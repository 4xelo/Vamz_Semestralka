//
//  IngredientsViewCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 09/06/2022.
//

import UIKit

class IngredientsViewCell: UITableViewCell {
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
