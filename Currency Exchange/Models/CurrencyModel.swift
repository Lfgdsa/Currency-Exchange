//
//  CurrencyModel.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 20.11.2022.
//

import Foundation

struct ResultCurrencyData: Codable {
  let data: [CurrencyModel]
}

struct CurrencyModel: Codable {
  let id: String?
  let name: String?
  let priceUsd: String?
  let changePercent24Hr: String?
}
