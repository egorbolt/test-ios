//
//  DishCell.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit
import DataAPILayer

// MARK: - DishCell

final class DishCell: UITableViewCell {
    @IBOutlet private var dishCountView: UIView!
    @IBOutlet private var dishCountLabel: UILabel!
    @IBOutlet private var dishNameLabel: UILabel!
    @IBOutlet private var dishPriceLabel: UILabel!
    
    static let cellIdentifier = "DishCell"
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
