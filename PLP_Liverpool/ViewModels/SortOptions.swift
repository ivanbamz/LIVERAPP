//
//  SortOption.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import Foundation
import SwiftUI

enum SortOptions: String, CaseIterable, Identifiable {
    case predefined = "predefined"
    case lowestPrice = "lowestPrice"
    case highestPrice = "highestPrice"
    case relevance = "relevance"
    case newest = "newest"
    case ratings = "ratings"
    
    var id: SortOptions { self }
    
    var name: String{
        switch self{
        case .lowestPrice:
            "Menor Precio"
        case .highestPrice:
            "Mayor Precio"
        case .relevance:
            "Relevancia"
        case .newest:
            "Lo más nuevo"
        case .ratings:
            "Puntuación"
        default:
            "Default"
        }
    }
    var sort: String{
        switch self {
        case .lowestPrice:
            "predefined"
        case .highestPrice:
            "highestPrice"
        case .relevance:
            "relevance"
        case .newest:
            "newest"
        case .ratings:
            "ratings"
        default:
            "Default"
            
        }
        
    }
}
