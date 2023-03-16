//
//  CoinManager.swift
//  CryptoPrice
//
//  Created by Yevhenii Vladichuk on 14/03/2023.
//

import Foundation

protocol CoinManagerDelegat {
    func didUpdatePrice(_ coinManager: CoinManager, priceModel: PriceModel)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegat?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "E8ED99EF-6C29-43A7-B8D2-15ED7F4D08A0"
    let currencyArray = ["USD", "EUR", "UAH", "NOK"]
    
    
    func getCoinPrice(for currency: String) {
        
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: url)
        
    }
    
    func performRequest(with url: String) {
        // create URL
        if let url = URL(string: url) {
            
            // create session
            let session = URLSession(configuration: .default)
            
            // create task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let priceModel = self.parseJSON(priceData: safeData) {
                        self.delegate?.didUpdatePrice(self, priceModel: priceModel)
                    }
                }
            }
            // start task
            task.resume()
        }
    }
    
    func parseJSON(priceData: Data) -> PriceModel? {
        
        let decoder = JSONDecoder()
        do{
            
            let decodeData =  try decoder.decode(DataModel.self, from: priceData)
            
            let decodeRate = decodeData.rate
            let decodeAsset = decodeData.asset_id_quote
            
            let priceModel = PriceModel(price: decodeRate, currency: decodeAsset)
            
            return priceModel
            
        } catch {
            print("Error \(error) in parseJSONfunc, the key expired, you need to wait 24 hours")
            return nil
        }
    }
}
