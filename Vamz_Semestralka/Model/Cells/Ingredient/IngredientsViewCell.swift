//
//  IngredientsViewCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 09/06/2022.
//

import UIKit

/// Trieda sa stara o UI elementy IngredientsViewCelly.
class IngredientsViewCell: UITableViewCell {
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    
    /// Metoda zobudi cellu a nastavi styl selektovania na ziadny.
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    
    /// Metoda nastavi styl selektovania.
    /// - Parameters:
    ///   - selected: True - nastavi celu ako oznacenu, false - ako neoznacenu.
    ///   - animated: True - nastavi prechod medzi oznacenymi stavmi na animovany, false - nastavi porechod medzi stavmi na okamzity.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
