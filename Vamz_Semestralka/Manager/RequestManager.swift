//
//  RequestManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 04/05/2022.
//

import Foundation
import Alamofire


//typealias FoodCompletionHandler = ((FoodResponse?,Error?)-> Void)
class RequestManager {
    
    // MARK: - Variables
    static let shared = RequestManager()  //singleton
    
    // MARK: - Get Categories
    func getCategoryData(completion: @escaping (Result<CategoryResponse, AFError>) -> Void) {
        let decoder = JSONDecoder()
        
        AF.request(Constants.Urls.recipeCategoryURL, method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: CategoryResponse.self, decoder: decoder) {
                completion($0.result)
        }
    }
    
    // MARK: - GetRecipes
    func getRecipeData(for name: String, completion: @escaping (Result<RecipeResponse, AFError>) -> Void) {
        
        let decoder = JSONDecoder()
        
        AF.request(Constants.Urls.recipeByCategoryName(name),method: .get,parameters: nil)
            .validate()
            .responseDecodable(of: RecipeResponse.self,  decoder: decoder) {
                print($0.result)
                completion($0.result)
            }
        
    }

}

    
    

