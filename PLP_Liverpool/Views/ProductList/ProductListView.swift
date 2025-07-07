//
//  ProductListView.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListVM()
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack{
                    Text("Productos")
                        .font(.largeTitle)
                    Spacer()
                    DropSort(selectedOption: $viewModel.selectedSortOption)
                        .onChange(of: viewModel.selectedSortOption) {
                            viewModel.applySortOption(viewModel.selectedSortOption, searchTerm: "")
                        }
                }
                .padding(.horizontal, 25)
                
                VStack{
                    
                    if viewModel.isLoading {
                        ProgressView("Cargando productos…")
                            .padding()
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        List(viewModel.products) { product in
                            ProductView(product: product)
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                .onAppear {
                    viewModel.loadProducts(searchTerm: "", sortOption: "", page: viewModel.currentPage)
                    
                    
                }
                
                //Aquí se manda a llamar al footer con paginación
                VStack{
                    PaginationFooterView(
                        currentPage: $viewModel.currentPage,
                        totalPages: viewModel.totalPages
                    ) .onChange(of: viewModel.currentPage) {
                        viewModel.loadProducts(searchTerm: "", sortOption: viewModel.selectedSortOption.sort, page: viewModel.currentPage)
                    }
                }
            }
        }
    }
}

