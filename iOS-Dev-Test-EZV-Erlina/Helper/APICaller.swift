//
//  APICaller.swift
//  iOS-Dev-Test-EZV-Erlina
//
//  Created by erlina ng on 07/04/23.
//

import Foundation

enum APIError : Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getAllProduct(completion : @escaping (Result<[Product], Error>) -> Void) {
        if let url = URL(string: "https://dummyjson.com/products") {
            
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else { return }
                do {
                    let results = try JSONDecoder().decode(ProductResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(results.products))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
}
