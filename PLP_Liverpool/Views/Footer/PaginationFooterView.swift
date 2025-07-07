//
//  PaginationFooterView.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import SwiftUI

struct PaginationFooterView: View {
    @Binding var currentPage: Int    // ← Ahora es Binding
    let totalPages: Int
    
    var body: some View {
        HStack(spacing: 8) {
            
            // ← Botón Anterior
            Button(action: {
                if currentPage > 1 {
                    currentPage -= 1
                }
            }) {
                Image(systemName: "chevron.left")
            }
            .disabled(currentPage == 1)
            
            // Primera página y puntos
            if currentPage > 3 {
                Button("1") { currentPage = 1 }
                Text("…")
            }
            
            // Rango de páginas visibles
            ForEach(pagesToShow(), id: \.self) { page in
                Button(action: {
                    currentPage = page
                }) {
                    Text("\(page)")
                        .padding(6)
                        .background(currentPage == page ? Color.blue : Color.clear)
                        .foregroundColor(currentPage == page ? .white : .primary)
                        .cornerRadius(6)
                }
            }
            
            // Última página y puntos
            if currentPage < totalPages - 2 {
                Text("…")
                Button("\(totalPages)") { currentPage = totalPages }
            }
            
            // ← Botón Siguiente
            Button(action: {
                if currentPage < totalPages {
                    currentPage += 1
                }
            }) {
                Image(systemName: "chevron.right")
            }
            .disabled(currentPage == totalPages)
        }
        .padding()
    }
    
    private func pagesToShow() -> [Int] {
        let start = max(1, currentPage - 2)
        let end = min(totalPages, currentPage + 2)
        return Array(start...end)
    }
}


#Preview{
    @Previewable @State var currentPage: Int = 1
    PaginationFooterView(currentPage: $currentPage, totalPages: 10)
}
