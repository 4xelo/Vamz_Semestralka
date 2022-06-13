//
//  FoodRecipeCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 22/05/2022.
//

import UIKit

/// Trieda ma na starosti UI elementy FoodRecipeCelly.
class FoodRecipeCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Lifecycle
    ///  Metoda zobudi cellu.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Metoda nastavi styl selektovania.
    /// - Parameters:
    ///   - selected: True - nastavi celu ako oznacenu, false - ako neoznacenu.
    ///   - animated: True - nastavi prechod medzi oznacenymi stavmi na animovany, false - nastavi porechod medzi stavmi na okamzity.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
