//
//  RequestManager.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 04/05/2022.
//

import Foundation
import Alamofire



/// Trieda sa stara o nacitanie dat z api.
class RequestManager {
    
    // MARK: - Variables
    static let shared = RequestManager()
    
    // MARK: - GetCategories
    /// Metoda nacita udaje o kategoriach z api.
    /// - Parameter completion: Completion, ktora sa ma vykonat po skonceni kodu.
    func getCategoryData(completion: @escaping (Result<CategoryResponse, AFError>) -> Void) {
        let decoder = JSONDecoder()
        
        AF.request(Constants.Urls.recipeCategoryURL, method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: CategoryResponse.self, decoder: decoder) {
                completion($0.result)
        }
    }
    
    // MARK: - GetRecipes
    /// Metoda nacita udaje o receptoch z api, podla zadaneho nazvu kategorie.
    /// - Parameters:
    ///   - name: Nazov kategorie ktoru sme zvolili.
    ///   - completion: Completion, ktora sa ma vykonat po skonceni kodu.
    func getRecipeData(for name: String, completion: @escaping (Result<RecipeResponse, AFError>) -> Void) {
        
        let decoder = JSONDecoder()
        
        AF.request(Constants.Urls.recipeByCategoryName(name),method: .get,parameters: nil)
            .validate()
            .responseDecodable(of: RecipeResponse.self,  decoder: decoder) {
                completion($0.result)
            }
    }
    
    //MARK: - GetFoodaData
    /// Metoda nacita udaje o konkretnom jedle z api, podla zadaneho idcka.
    /// - Parameters:
    ///   - id: Kod receptu, ktory sme vybrali.
    ///   - completion: Completion, ktora sa ma vykonat po skonceni kodu.
    func getFoodDetailData(for id: String, completion: @escaping (Result<FoodDetailResponse,AFError>) -> Void) {
        let decoder = JSONDecoder()
        
        AF.request(Constants.Urls.foodDetailById(id),method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: FoodDetailResponse.self, decoder: decoder) {
                completion($0.result)
            }
    }
}

    
    

