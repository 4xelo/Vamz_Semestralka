//
//  ShopListManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import Foundation


typealias shopListCompletion = () -> Void
class ShopListManager {
    
    static let shared = ShopListManager()
    
    
    var shoppingItemsList : [String] = []
    
    private let key = "shoppingItem_list"
    
    private func saveItems() {
        let data = try? JSONEncoder().encode(shoppingItemsList)
        UserDefaults.standard.set(data, forKey: key)
    }
    func loadItems(completion: shopListCompletion) {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedItems = try? JSONDecoder().decode([String].self, from: data)  else {
                return
            }
        self.shoppingItemsList = savedItems
        completion()    
    }
    
    func addItem(String text: String, completion: shopListCompletion) {
        shoppingItemsList.append(text)
        saveItems()
        completion()
    }
    func removeItem(at position: Int, completion: shopListCompletion) {
        shoppingItemsList.remove(at: position)
        saveItems()
        completion()
    }
    
    
}
