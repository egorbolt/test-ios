//
//  TableInfoCell.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit


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

class TableInfoCell: UITableViewCell {
    @IBOutlet var tableNumberBackView: UIView!
    @IBOutlet var tableNumberLabel: UILabel!
    @IBOutlet var guestsLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.tintColor = .red
        backgroundColor = UIColor(hex: "#F7F8F9")
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableNumberBackView.layer.cornerRadius = 10
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10)
        )
    }
}

// MARK: - Configuration

extension TableInfoCell {
    func configure(with model: TableInfoCellModel) {
        tableNumberBackView.backgroundColor = UIColor.init(hex: "#D96A69")
        
        tableNumberLabel.text = model.table
        tableNumberLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        tableNumberLabel.textColor = .white
        
        guestsLabel.text = String(model.guests)
        dateLabel.text = "Some date here"
        priceLabel.text = model.price
    }
}
