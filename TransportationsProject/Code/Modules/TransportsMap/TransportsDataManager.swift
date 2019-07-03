//
//  TransportsDataManager.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit

protocol TransportsDataManagerProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> DATA_MANAGER
     */
}

class TransportsDataManager {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    private let apiClient: TransportsApiClientProtocol
    
    // MARK: - Initialization
    
    init(apiClient: TransportsApiClientProtocol) {
        self.apiClient = apiClient
    }
}

extension TransportsDataManager: TransportsDataManagerProtocol {
    
}

