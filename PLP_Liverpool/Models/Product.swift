//
//  Product.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import Foundation

struct ProductResponse: Codable {
    let plpResults: PlpResults
}

struct PlpResults: Codable {
    let plpState: PlpState
    let records: [Product]
}

struct PlpState: Codable {
    let totalNumRecs: Int
}

struct Product: Codable, Identifiable {
    let id: String
    let productDisplayName: String
    let galleryImagesVariants: [String]
    let listPrice: Double
    let promoPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case productDisplayName
        case galleryImagesVariants
        case listPrice
        case promoPrice
    }
}
