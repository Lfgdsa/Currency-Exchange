//
//  API.swift
//  Currency Exchange
//
//  Created by Eugene Babenko on 20.11.2022.
//

import Foundation
//import UIKit

protocol APIProtocol {
  func getAllCurrentCurrencyExchangeRate(completion: @escaping (([CurrencyModel]) -> Void))
  func getImageFor(symbol: String?, complition: @escaping (Data) -> Void)

}

final class API: APIProtocol {
  
  private var mainUrlAPI = "https://api.coincap.io/v2"
  
  // MARK: get actual list of currency rate
  func getAllCurrentCurrencyExchangeRate(completion: @escaping (([CurrencyModel]) -> Void)) {

    guard let url = URL(string: "\(mainUrlAPI)/assets") else { return }

    let request = URLRequest(url: url)

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
  
  // MARK: - get image for exect crypto symbol
  func getImageFor(symbol: String?, complition: @escaping (Data) -> Void) {
    
    guard let url = URL(string: "\(mainUrlAPI)/assets/icons/\(String(describing: symbol))@2x.png") else { return }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, _, error in
      guard let data = data else { return }
      print(data)
      complition(data)
    }.resume()
  }
}
