//
//  SearchBar.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//


import SwiftUI
struct SearchBar: View {
    
    //Esta variable debe inyectarse en el URL
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Buscar productos...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .font(.system(size: 16))
    }
}

#Preview {
    @Previewable @State var productTitle: String = ""
    SearchBar(searchText: $productTitle)
}
