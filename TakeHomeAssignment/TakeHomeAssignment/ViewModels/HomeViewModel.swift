//
//  HomeViewModel.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import Foundation

class HomeViewModel {
    var recipes: [Recipe] = [Recipe]()
    
    func fetchRecipes(completion: @escaping () -> Void) {
        APIService.shared.getRecipes { [weak self] result in
            
            switch result {
            case .success(let response):
                self?.recipes = response
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
