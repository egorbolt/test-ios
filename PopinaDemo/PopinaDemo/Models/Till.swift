//
//  Till.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation


struct Till: Codable {
    let type: String
    let orders: [Order]
    
    enum CodingKeys: String, CodingKey {
        case type = "object"
        case orders
    }
}
