//
//  ProductList.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import Foundation

class ProductListVM: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var currentPage: Int = 1
    @Published var totalPages: Int = 10
    @Published var selectedSortOption: SortOptions = .predefined
    
    private let service = ProductService()
    
    func loadProducts(searchTerm: String, sortOption: String, page: Int? = nil) {
        isLoading = true
        errorMessage = nil
        let pageToLoad = page ?? currentPage
        currentPage = pageToLoad
        
        service.fetchProducts(searchTerm: searchTerm, sortOption: sortOption, page: pageToLoad) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func goToPage(_ page: Int, searchTerm: String, sortOption: String) {
        guard page >= 1, page <= totalPages else { return }
        loadProducts(searchTerm: searchTerm, sortOption: sortOption, page: page)
    }
    
    func applySortOption(_ sortOption: SortOptions, searchTerm: String) {
        selectedSortOption = sortOption
        loadProducts(searchTerm: searchTerm, sortOption: sortOption.sort, page: 1)
    }
}
