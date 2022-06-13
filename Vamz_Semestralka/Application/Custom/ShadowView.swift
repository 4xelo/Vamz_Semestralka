//
//  ShadowView.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 30/04/2022.
//

import UIKit

/// Vlastna trieda viewu, dekorativny prvok, ktory vytvori efekt tiena pod hlavnym viewom
class ShadowView: UIView {


    override func draw(_ rect: CGRect) {
        // Drawing code
        self.applyShadow()
    }
    
    // MARK: - Shadowing
    /// Metoda vykresli view tak ze aplikuje tienovanie.
    func applyShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4
        let radii = CGSize(width: 4, height: 4)
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: radii).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
