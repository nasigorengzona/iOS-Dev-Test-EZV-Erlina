//
//  HomeViewModel.swift
//  iOS-Dev-Test-EZV-Erlina
//
//  Created by erlina ng on 07/04/23.
//
import SwiftUI
import CoreData

class HomeViewModel : ObservableObject {
    @Published var allProducts : [Product] = [Product]()

    init(){
        getAllProduct()
    }
    
    private func getAllProduct() {
        APICaller.shared.getAllProduct { result in
            switch result {
            case .success(let products) :
                self.allProducts.append(contentsOf: products)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
