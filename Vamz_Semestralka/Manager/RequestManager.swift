//
//  RequestManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 04/05/2022.
//

import Foundation

struct RequestManager {
    
    static let shared = RequestManager()  //singleton
    
    func getFoodData(String food: String) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.edamam.com"
        urlComponents.path = "/api/recipes/v2/\(food)?"
        let appIdItem = URLQueryItem(name: "app_id", value: "9a678030")
        let appKeyItem = URLQueryItem(name:"app_key", value: "9cdc5f81ab63e865f01d9f6bb828cb8b")
        let typeItem = URLQueryItem(name:"type", value: "public")
        urlComponents.queryItems = [appIdItem, appKeyItem, typeItem]
        
        
        guard let url = urlComponents.url else {
            return
        }
    
                
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let recipeResponse = try decoder.decode(FoodResponse.self, from: data)
                
                print(recipeResponse)
            }catch let error{
                print(error)
            }
        }
        task.resume()
    }
    
}

    
    

