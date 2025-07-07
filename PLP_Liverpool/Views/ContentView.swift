//
//  ContentView.swift
//  PLP_Liverpool
//
//  Created by  IVAN BARAJAS  on 06/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack{
            
            VStack{
                
                //Esta VSctack debe mostrar la barra superior; debe ser rosa y ocupar únicamente la barra superior
                
                Header(titulo: "Liverpool", searchText: $searchText)
                
                
                //Esta View debe mostrar el listado de productos
                    
                ProductListView()
                
               
                
            }
        }
    }
}

#Preview {
    ContentView()
}
