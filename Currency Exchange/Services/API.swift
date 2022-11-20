//
//  API.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 20.11.2022.
//

import Foundation

protocol APIProtocol {
  func getAllCurrentCurrencyExchangeRate(completion: @escaping (([CurrencyModel]) -> Void))

}

final class API: APIProtocol {
  
  private var url = "https://api.coincap.io/v2"
  
  // MARK: получаем актуальный список курса валют
  func getAllCurrentCurrencyExchangeRate(completion: @escaping (([CurrencyModel]) -> Void)) {

    guard let currentUrl = URL(string: "\(url)/assets") else { return }

    let request = URLRequest(url: currentUrl)

    URLSession.shared.dataTask(with: request) { data, _, error  in
      guard let data = data else { return }
      print(data)
      do {
        let decodeData = try JSONDecoder().decode(ResultCurrencyData.self, from: data)
        completion(decodeData.data)
        print("decoded data = \(decodeData.data)")
      } catch {
        print("Can't parse JSON")
        return
      }

    }.resume()
  }
}
