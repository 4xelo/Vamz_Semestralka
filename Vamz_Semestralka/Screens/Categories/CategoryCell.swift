//
//  CategoryCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 01/05/2022.
//

import UIKit

class CategoryCell: UITableViewCell {

    

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

