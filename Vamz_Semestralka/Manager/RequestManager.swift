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
    
    static let shared = RequestManager()  //singleton
    
    func getCategoryData(completion: @escaping (Result<RecipeCategoryResponse, AFError>) -> Void) {
        
        let decoder = JSONDecoder()
        
        AF.request(Constants.Urls.recipeCategoryURL, method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: RecipeCategoryResponse.self, decoder: decoder) {
                completion($0.result)
        }
    }
    
    func getRecipeData(for parameters: RecipeRequest, completion: @escaping (Result<RecipeResponse, AFError>) -> Void) {
        
        let decoder = JSONDecoder()
        
        AF.request(Constants.Urls.recipeCategoryURL,method: .get,parameters: parameters)
            .validate()
            .responseDecodable(of: RecipeResponse.self,  decoder: decoder) {
                completion($0.result)
            }
        
    }

}

    
    

