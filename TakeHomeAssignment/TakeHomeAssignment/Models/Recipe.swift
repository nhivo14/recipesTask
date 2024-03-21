//
//  Recipe.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import Foundation

struct Recipe: Codable {
    let calories: String?
    let carbos: String?
    let description: String?
    let difficulty: Int?
    let fats: String?
    let headline: String?
    let id: String
    let image: String?
    let name: String
    let proteins: String?
    let thumb: String?
    let time: String?
}
