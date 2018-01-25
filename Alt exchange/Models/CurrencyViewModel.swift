//
//  CurrencyViewModel.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/23/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import Foundation
import Moya
import RxSwift

final class CurrencyViewModel {
    
    let provider = MoyaProvider<CoinMarketCap>()
    
    func getCurrencies() -> Observable<[Currency]> {
        return provider.rx.request(.ticker(start: 0, limit: 0))
            .debug()
            .map([Currency].self)
            .asObservable()
    }
    
}

