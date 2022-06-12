//
//  HistoryManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 11/06/2022.
//

import Foundation
typealias historyCompletion = () -> Void

class HistoryManager {
    
    // MARK: - Variables
    static let shared = HistoryManager()
    var historyItemsList : [Latest] = []
    private let key = "historyItem"
    
    // MARK: - Save Items
    private func saveItems() {
        let data = try? JSONEncoder().encode(historyItemsList)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    // MARK: - Load Items
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
    func addItem(_ item: Latest, completion: historyCompletion) {
        if (historyItemsList.count < 5)
        {
            historyItemsList.append(item)
            saveItems()
        }
        else {
            historyItemsList.remove(at: 0)
            historyItemsList.append(item)
            saveItems()
        }
        completion()
    }
    
    func listSize() -> Int {
        return historyItemsList.count
    }
    
}

