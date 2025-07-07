//
//  ProductView.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 12) {
            
            // 1. Imagen del producto
            AsyncImage(url: URL(string: product.galleryImagesVariants.first ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(width: 90, height: 90)
            }
            
            // 2. Nombre y precios
            VStack(alignment: .leading, spacing: 6) {
                
                // Nombre
                Text(product.productDisplayName)
                    .font(.headline)
                    .lineLimit(2)
                
                // Precios
                HStack(spacing: 8) {
                    if(product.listPrice != product.promoPrice){
                        Text(String(format: "$%.2f", product.listPrice))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .strikethrough()
                        
                    }
                        
                    Text(String(format: "$%.2f", product.promoPrice))
                        .font(.subheadline)
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                    
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
    }
}

#Preview {
    ProductView(product: Product(
        id: "1",
        productDisplayName: "Jersey de Club América local authentic Adidas para hombre",
        galleryImagesVariants: ["https://ss205.liverpool.com.mx/lg/1176238739.jpg",
                                "https://ss205.liverpool.com.mx/lg/1176238739.jpg",
                                "https://ss205.liverpool.com.mx/lg/1176238739.jpg",
                                "https://ss205.liverpool.com.mx/lg/1176238739.jpg"],
        listPrice: 1500.00,
        promoPrice: 1500.00
    ))
}
