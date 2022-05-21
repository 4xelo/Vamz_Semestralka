//
//  ListViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var list: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = list
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done,target: self, action: #selector(deleteList))
    }
    
    
    @objc func deleteList() {
        
//        let newCount = count - 1
//
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(count)")
    }
  

}

