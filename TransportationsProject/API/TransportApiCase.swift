//
//  TransportApiCase.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

enum TransportsApiCase {
    
    case listTransports(firstQueryElement: String, secondQueryElement: String)
}

extension TransportsApiCase: Endpoint {
    var firstQueryElement: URLQueryItem {
        
        switch self {
        case .listTransports(let queryElement):
            
            return URLQueryItem(name: "upperRightLatLon", value: queryElement.firstQueryElement)
        }
    }
    
    var secondQueryElement: URLQueryItem {
        
        switch self {
        case .listTransports(let queryElement):
            
            return URLQueryItem(name: "lowerLeftLatLon", value: queryElement.secondQueryElement)
        }
    }
    
    var base: String {
        return "https://apidev.meep.me"
    }
    
    var path: String {
        
        switch self {
        case .listTransports:
            return "/tripplan/api/v1/routers/lisboa/resources"
        }
    }
}
