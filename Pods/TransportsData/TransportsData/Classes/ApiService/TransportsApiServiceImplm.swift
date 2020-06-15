//
//  TransportsApiServiceImplm.swift
//  TransportsData
//
//  Created by Miguel Goñi on 06/06/2020.
//

import Foundation
import TransportationApiClient
import TransportationDomain
import RxSwift

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
    
    public func getTransportElements(request: TransportsRequest, companyZone: String) -> Single<TransportResponse> {
        
        return Single.create { [unowned self] observer in
            self.apiService.send(request, success: { (success) in
                observer(.success(success))
            }) { (serverError) in
                var error: ErrorResponse = ErrorResponse.generic()
                if let clientError = serverError.clientError as? ErrorResponseContainer {
                    error = clientError.error
                } else if let rawError = serverError.rawError {
                    error = ErrorResponse.generic(error: rawError)
                }
                
                observer(.error(error))
            }
            return Disposables.create()
            
        }
        
    }
    
    
}
