//
//  HistoryManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 11/06/2022.
//

import Foundation
typealias historyCompletion = () -> Void

/// Trieda sa stara o spravanie Historie poslednych zobrazenych receptov.
class HistoryManager {
    
    // MARK: - Variables
    static let shared = HistoryManager()
    var historyItemsList : [Latest] = []
    private let key = "historyItem"
    
    // MARK: - Save Items
    /// Metoda ulozi prvky do pamati UserDefaults podla daneho kluca.
    private func saveItems() {
        let data = try? JSONEncoder().encode(historyItemsList)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    // MARK: - Load Items
    /// Metoda nacita prvky z userDefaults podla kluca.
    /// - Parameter completion: completion, ktora sa ma vykonat po skonceni funkcie.
    func loadItems(completion: historyCompletion) {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedItems = try? JSONDecoder().decode([Latest].self, from: data) else {
                return
            }
        self.historyItemsList = savedItems
        completion()
    }
    
    // MARK: - Add Items
    /// Metoda prida do zoznamu novy prvok.
    /// - Parameter item: Prvok, ktory chceme pridat.
    func addItem(_ item: Latest) {
        if (historyItemsList.count < 5)
        {
            historyItemsList.insert(item, at: 0)
            saveItems()
        }
        else {
            historyItemsList.remove(at: historyItemsList.count-1)
            historyItemsList.insert(item, at: 0)
            saveItems()
        }
       
    }

    
}

