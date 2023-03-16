//
//  ViewController.swift
//  CryptoPrice
//
//  Created by Yevhenii Vladichuk on 13/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let uI = UserInterface()
    var coinManager = CoinManager()
    
    override func loadView() {
        super.loadView()
        view = uI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uI.spinnigWheel.dataSource = self
        uI.spinnigWheel.delegate = self
        
        coinManager.delegate = self
        coinManager.getCoinPrice(for: "USD")
    }
}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    // number of column
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // number of row
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    
    // set title with color
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = coinManager.currencyArray[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "TitleColor")!])
        return myTitle
    }
    
    // selected row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

// MARK: - CoinManagerDelegat

extension ViewController: CoinManagerDelegat {
    
    func didUpdatePrice(_ coinManager: CoinManager, priceModel: PriceModel) {
        DispatchQueue.main.async {
            self.uI.currencyLabel.text = priceModel.currency
            self.uI.priceLabel.text = String(format: "%.2f", priceModel.price)
        }
    }
    
    
}




