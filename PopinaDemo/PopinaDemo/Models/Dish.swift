//
//  MenuItem.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation


struct Dish: Codable {
    let type: String
    let id: Int
    let name: String
    let price: Int
    let currency: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case type = "object"
        case id
        case name
        case price
        case currency
        case color
    }
}
