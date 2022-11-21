//
//  Float + Clean.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 21.11.2022.
//

import Foundation

extension Float {
    var clean: String {
      return String(format: "%.2f", self)
    }
}
