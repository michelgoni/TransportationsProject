//
//  TransportsApiService.swift
//  TransportsData
//
//  Created by Miguel Goñi on 06/06/2020.
//

import Foundation
import TransportationDomain
import TransportationApiClient

public protocol TransportsApiService {
    func getElements(request: TransportsRequest, companyZone: String, completion: @escaping (Result<TransportResponse, ErrorResponse>) -> Void)
    
}
