//
//  TableInfoCell.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit

private struct Constants {
    let tableViewBackColor = UIColor(hex: "#F7F8F9")
    let tableNumberBackViewColor = UIColor.init(hex: "#D96A69")
}
private let consts = Constants()

class TableInfoCell: UITableViewCell {
    @IBOutlet var tableNumberBackView: UIView!
    @IBOutlet var tableNumberLabel: UILabel!
    @IBOutlet var guestsLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    static let cellIdentifier = "TableInfoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.tintColor = .red
        backgroundColor = consts.tableViewBackColor
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableNumberBackView.layer.cornerRadius = 10
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        )
    }
}

// MARK: - Configuration

extension TableInfoCell {
    func configure(with model: TableInfoCellModel) {
        tableNumberBackView.backgroundColor = consts.tableNumberBackViewColor
        
        tableNumberLabel.text = model.table
        tableNumberLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        tableNumberLabel.textColor = .white
        
        guestsLabel.text = "🙂 " + String(model.guests)
        guestsLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        dateLabel.text = model.date
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        priceLabel.text = model.price
        priceLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
}
