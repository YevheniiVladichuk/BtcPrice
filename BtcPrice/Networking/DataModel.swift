//
//  DataModel.swift
//  CryptoPrice
//
//  Created by Yevhenii Vladichuk on 14/03/2023.
//

import Foundation

struct DataModel: Decodable {
    let rate: Float
    let asset_id_quote: String
}
