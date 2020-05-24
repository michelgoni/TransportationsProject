//
//  TransportsDataManager.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import TransportsData
import TransportationDomain

protocol TransportsDataManagerProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> DATA_MANAGER
     */
    func getTransports( success: @escaping (TransportResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
    func getTitle() -> String
}

final class TransportsDataManager {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    private let apiClient: TransportsApiClientProtocol
    
    // MARK: - Initialization
    
    init(apiClient: TransportsApiClientProtocol) {
        self.apiClient = apiClient
    }
}

extension TransportsDataManager: TransportsDataManagerProtocol {
    func getTransports(success: @escaping (TransportResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        apiClient.getTransports(success: success, failure: failure)
    }
    
    func getTitle() -> String {
        
        return "TRANSPORT_VC_TITLE".localized
    }
    
}

