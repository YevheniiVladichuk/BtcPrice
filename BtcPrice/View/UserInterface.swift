//
//  UserInterface.swift
//  CryptoPrice
//
//  Created by Yevhenii Vladichuk on 13/03/2023.
//

import Foundation
import UIKit

class UserInterface: UIView {
    
    let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor(named: "TopViewColor")
        topView.layer.shadowColor = UIColor.black.cgColor
        return topView
    }()
    
    let hStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.axis = .horizontal
        hStackView.distribution = .fill
        hStackView.spacing = 20
        return hStackView
    }()
    
    let bitcoinImage: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 15
        icon.image = UIImage(named: "bitcoin")
        icon.clipsToBounds = true
        return icon
    }()
    
    let vStackView: UIStackView = {
        let vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.spacing = 5
        return vStackView
    }()
    
    let currencyLabel: UILabel = {
        let currencyLabel = UILabel()
        currencyLabel.font = UIFont(name: "Helvetica Neue", size: 30)
        currencyLabel.textColor = .white
        currencyLabel.textAlignment = .right
        return currencyLabel
    }()
    
    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont(name: "Helvetica Neue", size: 32)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .right
        return priceLabel
    }()

    let spinnigWheel: UIPickerView = {
        let spinnigWheel = UIPickerView()
        spinnigWheel.translatesAutoresizingMaskIntoConstraints = false
        return spinnigWheel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        
        addSubview(topView)
        topView.addSubview(hStackView)
        hStackView.addArrangedSubview(bitcoinImage)
        hStackView.addArrangedSubview(vStackView)
        vStackView.addArrangedSubview(currencyLabel)
        vStackView.addArrangedSubview(priceLabel)
        addSubview(spinnigWheel)
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 275),
            
            hStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            hStackView.heightAnchor.constraint(equalToConstant: 100),
            
            bitcoinImage.widthAnchor.constraint(equalToConstant: 100),
            bitcoinImage.heightAnchor.constraint(equalToConstant: 100),
            
            
            spinnigWheel.heightAnchor.constraint(equalToConstant: 216),
            spinnigWheel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            spinnigWheel.leadingAnchor.constraint(equalTo: leadingAnchor),
            spinnigWheel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

