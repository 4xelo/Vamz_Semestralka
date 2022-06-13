//
//  CategoryCell.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 01/05/2022.
//

import UIKit

/// Trieda sa stara o UI elementy CategoryCell
class CategoryCell: UITableViewCell {

    
    //MARK: - Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    
    //MARK: - Lifecycle
    /// Metoda zobudi cellu.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Metoda nastavi oznacenie celly.
    /// - Parameters:
    ///   - selected: Boolean, ktory hovori o tom ci bola cella oznacena alebo nie.
    ///   - animated: Boolean, ktory hovori o tom ci chcema nastavit animaciu na true alebo false.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

