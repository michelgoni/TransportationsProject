//
//  HomeApiClient.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import TransportationApiClient
import TransportsData
import TransportationDomain

protocol TransportsApiClientProtocol {
    
     func getTransports(success: @escaping (TransportResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
}

class TransportsApiClient: TransportsApiClientProtocol {
    
   func getTransports(success: @escaping (TransportResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        let request = TransportsRequest(baseApiParams: BaseApiParams(market: "lisboa"))
        TPAPIClient.shared.sendServer(request, success: success, failure: failure)
        
//        TransportsApi.shared.getTransportsList(from: .listTransports(firstQueryElement: firstQueryitem, secondQueryElement: secondQueryItem), completion: completion)
    }
    
}
