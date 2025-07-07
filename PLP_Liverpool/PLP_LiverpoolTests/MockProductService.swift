//
//  MockProductService.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import Foundation
@testable import PLP_Liverpool

class MockProductService: ProductService {
    
    var shouldReturnError = false
    
    override func fetchProducts(searchTerm: String, sortOption: String?, completion: @escaping (Result<[Product], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(URLError(.badURL)))
        } else {
            let mockProducts = [
                Product(id: "1", productDisplayName: "Producto Mock", galleryImagesVariants: ["https://ejemplo.com/imagen.jpg"], listPrice: 1000, promoPrice: 800)
            ]
            completion(.success(mockProducts))
        }
    }
}
