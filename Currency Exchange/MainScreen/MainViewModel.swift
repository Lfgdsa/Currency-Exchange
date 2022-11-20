//
//  MainViewModel.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 20.11.2022.
//

import Foundation


//example
//struct currencyCelViewModel {
//  let name: String?
//  let priceUsd: String?
//  let changePercent24Hr: String?
//}

protocol MainViewModelProtocol {
  func viewDidLoad()
  
  var currencyModels: [CurrencyModel]?  { get set }
  var delegate: MainViewModelOutPutProcol? { get set }
}

protocol MainViewModelOutPutProcol {
  func didDataRecived()
}

class MainViewModel: MainViewModelProtocol {
  
  var result: [CurrencyModel]?
  
  var delegate: MainViewModelOutPutProcol?
  
  var currencyModels: [CurrencyModel]? = [CurrencyModel]()
  
  let api: APIProtocol?
  
  init(api: APIProtocol) {
    self.api = api
  }
  
  func viewDidLoad() {
    api?.getAllCurrentCurrencyExchangeRate { [weak self] model in
      DispatchQueue.main.async {
        self?.currencyModels = model
        self?.delegate?.didDataRecived()
      }
    }
  }
}


