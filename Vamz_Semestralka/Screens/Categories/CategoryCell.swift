//
//  CategoryCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 01/05/2022.
//

import UIKit

class CategoryCell: UITableViewCell {

    
    //MARK: - Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

