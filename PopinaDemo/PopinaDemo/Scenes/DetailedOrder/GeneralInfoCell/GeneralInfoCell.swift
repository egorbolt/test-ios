//
//  GeneralInfoCell.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit

class GeneralInfoCell: UITableViewCell {
    @IBOutlet var dishesCountLabel: UILabel!
    @IBOutlet var verticalDividerView: UIView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var horizontalDividerView: UIView!
    @IBOutlet var cellDividerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        verticalDividerView.backgroundColor = UIColor(hex: "#F7F8F9")
        horizontalDividerView.backgroundColor = UIColor(hex: "#67A7E2")
        cellDividerView.backgroundColor = UIColor(hex: "#F8F8F8")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// MARK: - Configuration

extension GeneralInfoCell {
    func configure(with order: Order) {
        dishesCountLabel.text = String(order.items.count) + " produits"
        dishesCountLabel.textColor = UIColor(hex: "#B5BFC5")
        priceLabel.text = order.totalPrice
        priceLabel.textColor = UIColor(hex: "#67A7E2")
        
        dishesCountLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        priceLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)

    }
}
