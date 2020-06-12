//
//  File.swift
//  TransportsData
//
//  Created by Miguel Goñi on 03/06/2020.
//

import Foundation

public struct BaseApiParams {
    public let companyZone: String
    public let token: String?
    
    public init(market: String,
                token: String? = nil) {
        self.companyZone = market
        self.token = token
    }
}
