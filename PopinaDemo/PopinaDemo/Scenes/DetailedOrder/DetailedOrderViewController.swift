//
//  DetailedOrderViewController.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit
import DataAPILayer

// MARK: - DetailedOrderViewController

final class DetailedOrderViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private var tableStructure: [DetailedOrderCellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    func configure(with order: Order) {
        navigationItem.title = "\(order.table) table"
        tableStructure.append(.generalInfo(order))
        
        for dish in order.items {
            tableStructure.append(.dish(dish))
        }
    }
}

// MARK: - VC Configuration

private extension DetailedOrderViewController {
    func configureViewController() {
        configureTableView()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = UITableView.automaticDimension
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        tableView.register(
            UINib(nibName: GeneralInfoCell.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: GeneralInfoCell.cellIdentifier
        )
        tableView.register(
            UINib(nibName: DishCell.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: DishCell.cellIdentifier
        )
    }
}

// MARK: - UITableViewDelegate

extension DetailedOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension DetailedOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableStructure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableStructure[indexPath.row] {
        case let .dish(dish):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: DishCell.cellIdentifier
            ) as? DishCell {
                cell.configure(with: dish)
                return cell
            } else {
                return UITableViewCell()
            }
            
        case let .generalInfo(order):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: GeneralInfoCell.cellIdentifier
            ) as? GeneralInfoCell {
                cell.configure(with: order)
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
}

// MARK: - DetailedOrderCellType

enum DetailedOrderCellType {
    case generalInfo(Order)
    case dish(Dish)
}
