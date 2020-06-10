//
//  TransportsDataManager.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import TransportationDomain

protocol TransportsDataManagerProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> DATA_MANAGER
     */
    func getTransports( success: @escaping (TransportResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
    func getTitle() -> String
    func getTransportsElements(completion: @escaping(Result<[Transports], ErrorResponse>) -> Void)
}

final class TransportsDataManager {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    private let apiClient: TransportsApiClientProtocol
    private let useCase: TransportationsUseCase
    
    // MARK: - Initialization
    
    init(apiClient: TransportsApiClientProtocol, useCase: TransportationsUseCase) {
        self.apiClient = apiClient
        self.useCase = useCase
        
    }
}

extension TransportsDataManager: TransportsDataManagerProtocol {
    func getTransports(success: @escaping (TransportResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        apiClient.getTransports(success: success, failure: failure)
    }
    
    func getTitle() -> String {
        
        return "TRANSPORT_VC_TITLE".localized
    }
    
    func getTransportsElements(completion: @escaping(Result<[Transports], ErrorResponse>) -> Void) {
        useCase.getElements(companyZone: "lisboa", completion: completion)
    }
    
}

