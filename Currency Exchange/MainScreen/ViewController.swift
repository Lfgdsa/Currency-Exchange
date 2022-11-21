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
    tb.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.description())
    tb.separatorStyle = .none
    tb.allowsSelection = false
    tb.translatesAutoresizingMaskIntoConstraints = false
    return tb
  }()
  
  var viewModel: MainViewModelProtocol?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupVC()
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
    tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.size.width, height: view.frame.size.height, enableInsets: false)
  }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
  
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let rows = viewModel?.result.count else { return 0 }
    return rows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.description(), for: indexPath) as? MainTableViewCell else { return UITableViewCell()}
    
    guard let model = viewModel?.result[indexPath.row] else { return cell }
    
    cell.model = model
    return cell
  }
}

// MARK: - MainViewModelOutPutProcol
extension MainViewController: MainViewModelOutPutProcol {
  func didDataRecived() {
    tableView.reloadData()
  }
}
