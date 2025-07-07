//
//  Untitled.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import SwiftUI
struct Header: View {
    
    let titulo: String
    @Binding var searchText: String
    @State var showSortSheet = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                    //Esta VStack debe mostrar el titulo de la página
                    VStack{
                        
                        PageTitle(title: titulo)
                        
                    }
                }
                
                HStack{
                    //Esta VStack debe mostrar la barra de búsqueda
                    SearchBar(searchText: $searchText)
                    
                    
                    
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .background(Color.red.opacity(0.6))
        }
        Spacer()
    }
    
    
}

#Preview {
    
    @Previewable @State var productTitle: String = ""
    Header(titulo: "Productos", searchText: $productTitle)
}
