//
//  ShopListManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 21/05/2022.
//

import Foundation


typealias shopListCompletion = () -> Void

/// Trieda sa stara o spravanie nakupneho zoznamu, pridavanie novych poloziek, mazanie starych.
class ShopListManager {
    
    // MARK: - Variables
    static let shared = ShopListManager()
    var shoppingItemsList : [String] = []
    private let key = "shoppingItem_list"
    
    // MARK: - Save Items
    /// Metoda ulozi prvky do pamati UserDefaults.
    private func saveItems() {
        let data = try? JSONEncoder().encode(shoppingItemsList)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    // MARK: - Load Items
    /// Metoda nacita prvky z pamati UserDefaults.
    /// - Parameter completion: Completion, ktora sa ma vykonat po skonceni kodu.
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
    /// Metoda prida prvky do zoznamu a nasledne ich ulozi do pamati UserDefaults.
    /// - Parameters:
    ///   - text: Text ktory chceme pridat do zoznamu.
    ///   - completion: Completion, ktora sa ma vykonat po skonceni kodu.
    func addItem(String text: String, completion: shopListCompletion) {
        shoppingItemsList.append(text)
        saveItems()
        completion()
    }
    
    // MARK: - RemoveItem
    /// Metoda vymaze prvok z pamati UserDefaults.
    /// - Parameters:
    ///   - position: Index miesta z ktoreho chceme mazat.
    ///   - completion: Completion, ktora sa ma vykonat po skonceni kodu.
    func removeItem(at position: Int, completion: shopListCompletion) {
        shoppingItemsList.remove(at: position)
        saveItems()
        completion()
    }
    
    
}
