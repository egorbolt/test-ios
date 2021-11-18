//
//  DishCell.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit

class DishCell: UITableViewCell {
    @IBOutlet var dishCountView: UIView!
    @IBOutlet var dishCountLabel: UILabel!
    @IBOutlet var dishNameLabel: UILabel!
    @IBOutlet var dishPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// MARK: - Configuration

extension DishCell {
    func configure(with dish: Dish) {
        dishCountLabel.text = "1"
        dishNameLabel.text = dish.name
        dishPriceLabel.text = String(dish.price) + " \(dish.currency)"
        
        dishCountLabel.textColor = .white
        dishCountView.backgroundColor = UIColor(hex: dish.color)
        dishNameLabel.textColor = UIColor(hex: dish.color)
        dishPriceLabel.textColor = UIColor(hex: dish.color)
        
        dishCountLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        dishNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        dishPriceLabel.font = UIFont.systemFont(ofSize: 24, weight: .light)
    }
}
