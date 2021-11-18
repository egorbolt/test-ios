//
//  GeneralInfoCell.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit

// MARK: - Constants

private struct Constants {
    let dishesCountLabelColor = UIColor(hex: "#B5BFC5")
    let priceLabelColor = UIColor(hex: "#67A7E2")
    let verticalDividerViewColor = UIColor(hex: "#F7F8F9")
    let horizontalDividerViewColor = UIColor(hex: "#67A7E2")
    let cellDividerViewColor = UIColor(hex: "#F8F8F8")
}
private let consts = Constants()

// MARK: - GeneralInfoCell

final class GeneralInfoCell: UITableViewCell {
    @IBOutlet private var dishesCountLabel: UILabel!
    @IBOutlet private var verticalDividerView: UIView!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var horizontalDividerView: UIView!
    @IBOutlet private var cellDividerView: UIView!
    
    static let cellIdentifier = "GeneralInfoCell"
}

// MARK: - Configuration

extension GeneralInfoCell {
    func configure(with order: Order) {
        dishesCountLabel.text = String(order.items.count) + " produits"
        dishesCountLabel.textColor = consts.dishesCountLabelColor
        priceLabel.text = order.totalPrice
        priceLabel.textColor = consts.priceLabelColor
        
        verticalDividerView.backgroundColor = consts.verticalDividerViewColor
        horizontalDividerView.backgroundColor = consts.horizontalDividerViewColor
        cellDividerView.backgroundColor = consts.cellDividerViewColor
        
        dishesCountLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        priceLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    }
}
