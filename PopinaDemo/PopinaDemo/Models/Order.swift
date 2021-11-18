//
//  Order.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation


struct Order: Codable {
    let type: String
    let id: Int
    let table: String
    let guests: Int
    let date: String
    let items: [Dish]
    
    enum CodingKeys: String, CodingKey {
        case type = "object"
        case id
        case table
        case guests
        case date
        case items
    }
    
    var totalPrice: String {
        String(items.map { $0.price }.reduce(0, +)) + " \(items[0].currency)"
    }
}
