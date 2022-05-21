//
//  EntryViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var field: UITextField!
    var update: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveList))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveList()
        return true
    }
    
    @objc func saveList() {
        guard let text = field.text, !text.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "list_\(newCount)")
        
        update?()
        navigationController?.popViewController(animated: true)
        
    }

    
}
