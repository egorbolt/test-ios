//
//  ViewController.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit

class OrdersListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
        let api = DataAPI(initialURL: "https://raw.githubusercontent.com/popina/test-ios/master/data.json")
        api.getData(of: Till.self, httpMethod: .get) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .failure(_):
                    print("error")
                    
                case let .success(till):
                    self?.orders = till.orders
                    self?.navigationItem.title = "\(till.orders.count) commandes"
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Configuration

private extension OrdersListViewController {
    func configureViewController() {
        configureTableView()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(hex: "#F7F8F9")
        tableView.separatorStyle = .none
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = UITableView.automaticDimension
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        self.tableView.register(
            UINib(nibName: "TableInfoCell", bundle: nil),
            forCellReuseIdentifier: "TableInfoCell"
        )
    }
}

// MARK: - UITableViewDataSource

extension OrdersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableInfoCell"
        ) as? TableInfoCell {
            cell.configure(with: .init(order: orders[indexPath.row]))
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension OrdersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailedOrderViewController()
        vc.configure(with: orders[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
