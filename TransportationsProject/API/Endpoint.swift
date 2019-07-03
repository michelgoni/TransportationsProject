//
//  Endpoint.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var firstQueryElement: URLQueryItem {get}
    var secondQueryElement: URLQueryItem {get}
    
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        guard var components = URLComponents(string: base) else {
            fatalError("Sorry, but there must be a valid endPoint")
        }
        components.path = path
        components.queryItems = [firstQueryElement, secondQueryElement]
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
