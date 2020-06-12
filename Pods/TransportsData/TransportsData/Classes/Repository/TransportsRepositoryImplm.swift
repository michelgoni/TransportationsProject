//
//  TransportsRepositoryImplm.swift
//  TransportsData
//
//  Created by Miguel Goñi on 02/06/2020.
//

import Foundation
import TransportationDomain
import TransportationApiClient

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
}
