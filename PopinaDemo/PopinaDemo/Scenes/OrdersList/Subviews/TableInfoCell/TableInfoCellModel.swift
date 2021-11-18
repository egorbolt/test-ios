//
//  TableInfoCellModel.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 18.11.2021.
//

struct TableInfoCellModel {
    let id: Int
    let table: String
    let guests: Int
    let date: String
    let price: String
    
    init(order: Order) {
        id = order.id
        table = order.table
        guests = order.guests
        date = "18:20"
        price = order.totalPrice
    }
}

