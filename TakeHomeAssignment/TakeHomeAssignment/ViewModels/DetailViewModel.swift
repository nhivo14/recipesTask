//
//  DetailViewModel.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import Foundation

protocol DetailViewModelProtocol {
    func setData(data: Recipe)
    func getData() -> Recipe?
}

class DetailViewModel: DetailViewModelProtocol {
    var recipe: Recipe?

    func getData() -> Recipe? {
        return recipe
    }
    
    
    func setData(data: Recipe) {
        self.recipe = data
    }
    
    
}
