//
//  NetworkHelper.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/23/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import Foundation
import Moya

let coinMarketCapProvider = MoyaProvider<CoinMarketCap>()

public enum CoinMarketCap {
    case ticker(start: Int?, limit: Int?)
}

extension CoinMarketCap : TargetType {
    public var baseURL: URL { return URL(string: "https://api.coinmarketcap.com")! }
    
    public var path: String {
        switch self {
        case .ticker: return "/v1/ticker"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .ticker: return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .ticker: return Data(base64Encoded: "")!
        }
    }
    
    public var task: Task {
        switch self {
        case .ticker: return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Accept": "application/json", "Content-type": "application/json"]
    }
    
}
