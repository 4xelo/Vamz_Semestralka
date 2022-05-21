//
//  WebService.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 14/05/2022.
//

import Foundation

enum NetworkError: Error {
    
    case badRequest
    case decodingError
}
class WebService {
    
    
    //genericka metoda ktora vrati hocico, co je decodable, kedze kazda odpoved moze byt inak dekodovana tak parametrom bude closure ktora zoberie data a vrati hociaky je typ
    func get<T: Decodable>(url: URL, parse: (Data) ->T?) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        //checkujeme ci sme dostali dobru odpoved, ak nie tak vratime error
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
        
        guard let result = parse(data) else {
            
            throw NetworkError.decodingError
        }
        return result
    }
}
