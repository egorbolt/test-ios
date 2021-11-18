//
//  DetailedOrderViewController.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit


enum DetailedOrderCellType {
    case generalInfo(Order)
    case dish(Dish)
}

class DetailedOrderViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private var tableStructure: [DetailedOrderCellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configure(with order: Order) {
        navigationItem.title = "\(order.table) table"
        tableStructure.append(.generalInfo(order))
        
        for dish in order.items {
            tableStructure.append(.dish(dish))
        }
    }
}

// MARK: - Configuration

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
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = UITableView.automaticDimension
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        tableView.register(
            UINib(nibName: "GeneralInfoCell", bundle: nil),
            forCellReuseIdentifier: "GeneralInfoCell"
        )
        tableView.register(
            UINib(nibName: "DishCell", bundle: nil),
            forCellReuseIdentifier: "DishCell"
        )
    }
}

// MARK: - UITableViewDelegate

extension DetailedOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension DetailedOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableStructure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableStructure[indexPath.row] {
        case let .dish(dish):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: "DishCell"
            ) as? DishCell {
                cell.configure(with: dish)
                return cell
            } else {
                return UITableViewCell()
            }
            
        case let .generalInfo(order):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: "GeneralInfoCell"
            ) as? GeneralInfoCell {
                cell.configure(with: order)
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
}
