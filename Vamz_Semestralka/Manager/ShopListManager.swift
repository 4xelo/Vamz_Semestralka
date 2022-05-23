//
//  ShopListManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import Foundation


typealias shopListCompletion = () -> Void

class ShopListManager {
    
    // MARK: - Variables
    static let shared = ShopListManager()
    var shoppingItemsList : [String] = []
    private let key = "shoppingItem_list"
    
    // MARK: - Save Items
    private func saveItems() {
        let data = try? JSONEncoder().encode(shoppingItemsList)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    // MARK: - Load Items
    func loadItems(completion: shopListCompletion) {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedItems = try? JSONDecoder().decode([String].self, from: data)  else {
                return
            }
        self.shoppingItemsList = savedItems
        completion()    
    }
    
    // MARK: - Add Items
    func addItem(String text: String, completion: shopListCompletion) {
        shoppingItemsList.append(text)
        saveItems()
        completion()
    }
    
    // MARK: - RemoveItem
    func removeItem(at position: Int, completion: shopListCompletion) {
        shoppingItemsList.remove(at: position)
        saveItems()
        completion()
    }
    
    
}
