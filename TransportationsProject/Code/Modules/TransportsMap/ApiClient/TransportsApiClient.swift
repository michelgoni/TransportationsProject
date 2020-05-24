//
//  HomeApiClient.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import TransportationApiClient

protocol TransportsApiClientProtocol {
    
     func getTransports(firstQueryitem: String, secondQueryItem: String, completion: @escaping (Result<TransportResponse?, ApiError>) -> Void)
}

class TransportsApiClient: TransportsApiClientProtocol {
    
    func getTransports(firstQueryitem: String, secondQueryItem: String, completion: @escaping (Result<TransportResponse?, ApiError>) -> Void) {
        
        
        TransportsApi.shared.getTransportsList(from: .listTransports(firstQueryElement: firstQueryitem, secondQueryElement: secondQueryItem), completion: completion)
    }
    
}
