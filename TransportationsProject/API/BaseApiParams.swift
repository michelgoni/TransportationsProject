//
//  BaseApiParams.swift
//  TransportationsProject
//
//  Created by Miguel Goñi on 24/05/2020.
//  Copyright © 2020 Michel. All rights reserved.
//

import Foundation

struct BaseApiParams {
    let companyZone: String
    let token: String?
    
    init(market: String,
         token: String? = nil) {
        self.companyZone = market
        self.token = token
    }
}
