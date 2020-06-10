//
//  TransportationsUseCase.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 31/05/2020.
//

import Foundation

public protocol TransportationsUseCase {
    
    func getElements(companyZone: String, completion: @escaping (Result<[Transports], ErrorResponse>) -> Void)
}

public class TransportationsUseCaseImpl: TransportationsUseCase {
    
    private let repository: TransportRepository!
    
    public init(repository: TransportRepository) {
        self.repository = repository
    }
    
    //MARK: -TransportationsUseCase
    public func getElements(companyZone: String, completion: @escaping (Result<[Transports], ErrorResponse>) -> Void) {
        repository.getElements(companyZone: companyZone, completion: completion)
    }
    
    
    
}
