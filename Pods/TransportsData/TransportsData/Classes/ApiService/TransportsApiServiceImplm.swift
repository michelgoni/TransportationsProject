//
//  TransportsApiServiceImplm.swift
//  TransportsData
//
//  Created by Miguel Goñi on 06/06/2020.
//

import Foundation
import TransportationApiClient
import TransportationDomain

public class TransportsApiServiceImplm: TransportsApiService {
    
    private let apiService: APIClient
    
    public init(apiService: APIClient) {
        self.apiService = apiService
    }
    
    public func getElements(request: TransportsRequest, companyZone: String, completion: @escaping (Result<TransportResponse, ErrorResponse>) -> Void) {
        apiService.send(request, success: { (transportsResponse) in
          
            completion(.success(transportsResponse))
        }) { serverError in
            var error: ErrorResponse = ErrorResponse.generic()
            if let clientError = serverError.clientError as? ErrorResponseContainer {
                error = clientError.error
            } else if let rawError = serverError.rawError {
                error = ErrorResponse.generic(error: rawError)
            }
            completion(.failure(error))
        }
    }
    
    
}
