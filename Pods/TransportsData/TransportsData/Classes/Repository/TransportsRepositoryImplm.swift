//
//  TransportsRepositoryImplm.swift
//  TransportsData
//
//  Created by Miguel Goñi on 02/06/2020.
//

import Foundation
import TransportationDomain
import TransportationApiClient
import RxSwift

public class TransportsRepositoryImplm: TransportRepository {
    
    
    private let apiService: TransportsApiService
    
    public init(apiService: TransportsApiService) {
        self.apiService = apiService
    }
    
    public func getElements(companyZone: String, completion: @escaping (Result<[Transports], ErrorResponse>) -> Void) {
        let request = TransportsRequest(baseApiParams: BaseApiParams(market: companyZone))
        apiService.getElements(request: request, companyZone: companyZone) { result in
            switch result {
            case .success(let transportsResponse):
                let transports = transportsResponse.map(Transports.init)
                completion(.success(transports))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getTrasportElements(companyZone: String) -> Single<Result<[Transports], ErrorResponse>> {
        
        let request = TransportsRequest(baseApiParams: BaseApiParams(market: companyZone))

       return  apiService
        .getTransportElements(request: request, companyZone: companyZone)
        .map {$0.map(Transports.init)
       }.mapResponse()
            
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    
    func mapResponse() -> Single<Result<Element, ErrorResponse>> {
        
        self.map { .success($0) }
            .catchError { error in
                if let apiError = error as? ErrorResponse {
                    return .just(.failure(apiError))
                }
                return .just(.failure(ErrorResponse.generic()))
            }
        
    }
    
}

