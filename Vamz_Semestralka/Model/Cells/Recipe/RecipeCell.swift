//
//  RecipeCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 30/04/2022.
//

import UIKit

/// Trieda ma na starosti UI elementy TableViewCelly RecipeCell.xib.
class RecipeCell: UITableViewCell {

    
    // MARK: - Outlets
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    
    
    // MARK: - Lifecycle
    ///  Metoda zobudi cellu a nastavi styl selektovania na ziadny.
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none//neoznaci cellu
    }
    
    /// Metoda nastavi styl selektovania.
    /// - Parameters:
    ///   - selected: True - nastavi celu ako oznacenu, false - ako neoznacenu.
    ///   - animated: True - nastavi prechod medzi oznacenymi stavmi na animovany, false - nastavi porechod medzi stavmi na okamzity.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
