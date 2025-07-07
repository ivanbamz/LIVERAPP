//
//  ProductServiceTests.swift
//  PLP_Liverpool
//
//  Created by JESUS IVAN BARAJAS MUÑOZ on 06/07/25.
//

import XCTest
@testable import PLP_Liverpool

final class ProductServiceTests: XCTestCase {
    
    func testFetchProductsSuccess() {
        let service = MockProductService()
        let expectation = self.expectation(description: "Debería devolver productos")
        
        service.fetchProducts(searchTerm: "camisa", sortOption: "sortPrice|0") { result in
            switch result {
            case .success(let products):
                XCTAssertFalse(products.isEmpty, "La lista de productos no debe estar vacía")
                XCTAssertEqual(products.first?.productDisplayName, "Producto Mock")
            case .failure:
                XCTFail("No se esperaba un error en este caso")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testFetchProductsFailure() {
        let service = MockProductService()
        service.shouldReturnError = true
        
        let expectation = self.expectation(description: "Debería devolver error")
        
        service.fetchProducts(searchTerm: "camisa", sortOption: "sortPrice|0") { result in
            switch result {
            case .success:
                XCTFail("Se esperaba un error, pero se obtuvo éxito")
            case .failure(let error):
                XCTAssertNotNil(error, "Debe devolver un error válido")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
