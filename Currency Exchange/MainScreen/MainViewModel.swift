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
  
  var result: [MainTableViewCellModel] { get }
  var delegate: MainViewModelOutPutProcol? { get set }
}

protocol MainViewModelOutPutProcol {
  func didDataRecived()
}

class MainViewModel: MainViewModelProtocol {
  
  var result: [MainTableViewCellModel] = [MainTableViewCellModel]()
  
  var delegate: MainViewModelOutPutProcol?
  
  let api: APIProtocol?
  
  private var imageData = Data()
  
  init(api: APIProtocol) {
    self.api = api
  }
  
  func viewDidLoad() {
    api?.getAllCurrentCurrencyExchangeRate { [weak self] models in
      DispatchQueue.main.async {
        self?.transformModel(models)
        self?.delegate?.didDataRecived()
      }
    }
  }
//
  private func transformModel(_ models: [CurrencyModel]) {

    result = []

    for model in models {

      guard let name = model.name else { return }
      guard let priceForCurrentCurrency = Float(model.priceUsd ?? "") else { return }
      guard let dayChange = Float(model.changePercent24Hr ?? "") else { return }

      let newModel = MainTableViewCellModel(currency: name, priceForCurrentCurrency: priceForCurrentCurrency, dayChanges: dayChange)
      result.append(newModel)
    }
  }
}


