//
//  MainTableViewCell.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 20.11.2022.
//

import Foundation
import UIKit

struct MainTableViewCellModel {
  let currency: String
  let priceForCurrentCurrency: Float
  let dayChanges: Float
}

final class MainTableViewCell: UITableViewCell {
  
  var model: MainTableViewCellModel? {
    didSet {
      name.text = model?.currency ?? "No value"
      price.text = "$\(model?.priceForCurrentCurrency.clean ?? "No value")"
      changes.text = "\(model?.dayChanges.clean ?? "No value")%"
      priceChangesindicator.image = model?.dayChanges ?? 0 > 0 ? UIImage(named: "up") : UIImage(named: "down")
    }
  }
  
  private lazy var squareView: UIView = {
    let v = UIView()
    v.layer.cornerRadius = 10
    v.alpha = 0.65
    v.backgroundColor = #colorLiteral(red: 0.9945001006, green: 0.9352037311, blue: 0.8713182807, alpha: 1)
    return v
  }()
  
  private lazy var name: UILabel = {
    let lb = UILabel()
    lb.numberOfLines = 1
    lb.font = UIFont.systemFont(ofSize: 20)
    return lb
  }()
  
  private lazy var price: UILabel = {
    let lb = UILabel()
    lb.font = .systemFont(ofSize: 14, weight: .bold)
    return lb
  }()
  
  private lazy var changes: UILabel = {
    let lb = UILabel()
    lb.font = .systemFont(ofSize: 14, weight: .bold)
    lb.textAlignment = .right
    return lb
  }()
  
  private lazy var priceChangesindicator: UIImageView = {
    let iv = UIImageView()
    
    return iv
  }()
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setupCell() {
    addSubview(squareView)
    squareView.addSubview(name)
    squareView.addSubview(price)
    squareView.addSubview(changes)
    squareView.addSubview(priceChangesindicator)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    squareView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: frame.size.width, height: 70, enableInsets: false)
    
    name.anchor(top: squareView.topAnchor, left: squareView.leftAnchor, bottom: price.topAnchor, right: squareView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 10, paddingRight: 0, width: 150, height: 0, enableInsets: false)
    
    price.anchor(top: name.bottomAnchor, left: squareView.leftAnchor, bottom: squareView.bottomAnchor, right: squareView.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 150, height: 0, enableInsets: false)
    
    changes.anchor(top: squareView.topAnchor, left: nil, bottom: priceChangesindicator.topAnchor, right: squareView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 5, paddingRight: 5, width: 150, height: 0, enableInsets: false)
    
    priceChangesindicator.anchor(top: changes.bottomAnchor, left: nil, bottom: squareView.bottomAnchor, right: squareView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 5, width: 20, height: 20, enableInsets: false)
  }
}
