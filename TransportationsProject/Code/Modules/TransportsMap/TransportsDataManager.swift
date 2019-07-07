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
    func getTransports( completion: @escaping (Result<[TransportsResponse]?, ApiError>) -> Void)
    func getTitle() -> String
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
    func getTransports(completion: @escaping (Result<[TransportsResponse]?, ApiError>) -> Void) {
        
        apiClient.getTransports(firstQueryitem: Constants.MockQueryitems.firstQueryItem,
                                secondQueryItem: Constants.MockQueryitems.secondQueryItem, completion: completion)
    }
    
    func getTitle() -> String {
        
        return "Lisbon transport"
    }
    
}

