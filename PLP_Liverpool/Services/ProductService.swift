//
//  ProductService.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//
import Foundation


class ProductService {
    
    func fetchProducts(searchTerm: String, sortOption: String?, page: Int, completion: @escaping (Result<[Product], Error>) -> Void) {
        
        // 1. Construcción de la URL
        let baseURL = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf"
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "page-number", value: String(page)),
            URLQueryItem(name: "search-string", value: searchTerm),
            URLQueryItem(name: "sort-option", value: sortOption),
            URLQueryItem(name: "force-plp", value: "false"),
            URLQueryItem(name: "number-of-items-per-page", value: "20"),
            URLQueryItem(name: "cleanProductName", value: "false")
        ]
        
        guard let url = components?.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        // 2. Llamada a la API
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            // 3. Decodificación del JSON
            do {
                let decodedResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                completion(.success(decodedResponse.plpResults.records))
                let products = decodedResponse.plpResults.records
                completion(.success((products)))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
