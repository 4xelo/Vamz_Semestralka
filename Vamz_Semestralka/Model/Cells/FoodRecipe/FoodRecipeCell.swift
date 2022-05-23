//
//  FoodRecipeCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 22/05/2022.
//

import UIKit

class FoodRecipeCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
