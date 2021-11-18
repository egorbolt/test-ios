//
//  ViewController.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit

// MARK: - Constants

private struct Constants {
    let tableViewBackColor = UIColor(hex: "#F7F8F9")
    
    let dataURL = "https://raw.githubusercontent.com/popina/test-ios/master/data.json"
    let okAction = "OK"
    let error = "Error"
}
private let consts = Constants()

final class OrdersListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        performNetworkRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "\(orders.count) commandes"
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
        tableView.backgroundColor = consts.tableViewBackColor
        tableView.separatorStyle = .none
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = UITableView.automaticDimension
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        self.tableView.register(
            UINib(nibName: TableInfoCell.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: TableInfoCell.cellIdentifier
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
            withIdentifier: TableInfoCell.cellIdentifier
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
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Network

private extension OrdersListViewController {
    func performNetworkRequest() {
        let api = DataAPI(
            initialURL: consts.dataURL
        )
        api.getData(of: Till.self, httpMethod: .get) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case let .failure(error):
                    self?.showGeneralErrorAlert(message: error.localizedDescription)
                    
                case let .success(till):
                    self?.orders = till.orders
                    self?.navigationItem.title = "\(till.orders.count) commandes"
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func showGeneralErrorAlert(message: String) {
        let ok = AlertAction(title: consts.okAction)
        UIWindow.showAlert(title: consts.error, message: message, actions: [ok])
    }
}
