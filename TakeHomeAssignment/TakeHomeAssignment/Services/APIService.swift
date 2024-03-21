//
//  APIService.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import Foundation

enum APIError {
    
}

class APIService {
    private let networkService = NetworkService()
    static let shared = APIService()
    
    func getRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        networkService.get(endpoint: Endpoints.recipes, completion: completion)
    }
}
