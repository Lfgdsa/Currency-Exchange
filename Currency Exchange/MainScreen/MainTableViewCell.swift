//
//  MainTableViewCell.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 20.11.2022.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
  
  private var nameOfCurrency: UILabel = {
    let label = UILabel()
    return label
  }()
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
  }
}
