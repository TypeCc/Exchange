//
//  MyPost.swift
//  MVVM exchange
//
//  Created by serif mete on 6.02.2023.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let usd, eur, gbp, ga: Btc?
    let c, gag, btc, eth: Btc?
    let xu100: Btc?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
        case ga = "GA"
        case c = "C"
        case gag = "GAG"
        case btc = "BTC"
        case eth = "ETH"
        case xu100 = "XU100"
    }
}

// MARK: - Btc
struct Btc: Codable {
    let satis: String?
    let alis: String?
    let degisim: String?
    
}
