//
//  ViewController.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 20.11.2022.
//

import UIKit

class MainViewController: UIViewController {
  
  private var tableView: UITableView = {
    let tb = UITableView()
    tb.backgroundColor = .white
//    tb.register(nil, forCellReuseIdentifier: "cell")
    tb.translatesAutoresizingMaskIntoConstraints = false
    return tb
  }()
  
  var viewModel: MainViewModelProtocol?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupVC()
    tableView.reloadData()
    viewModel?.viewDidLoad()
  }
  
  private func setupVC() {
    addViews()
    setConstraints()
    delegating()
  }
}

// MARK: - setup view functions
extension MainViewController {
  private func delegating() {
    tableView.delegate = self
    tableView.dataSource = self
    viewModel?.delegate = self
  }
  
  private func addViews() {
    view.addSubview(tableView)
  }
  
  private func setConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),//.isActive = true,
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),//.isActive = true,
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),//.isActive = true,
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)//.isActive = true
    ])
  }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
  
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let rows = viewModel?.currencyModels?.count else { return 0 }
    return rows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    
    guard let model = viewModel?.currencyModels?[indexPath.row] else { return cell }
    
    cell.textLabel?.text = model.name
    return cell
  }
}

// MARK: - MainViewModelOutPutProcol
extension MainViewController: MainViewModelOutPutProcol {
  func didDataRecived() {
    tableView.reloadData()
  }
}
