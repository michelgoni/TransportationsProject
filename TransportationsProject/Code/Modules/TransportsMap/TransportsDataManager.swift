//
//  TransportsDataManager.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import TransportationDomain
import TransportsData

protocol TransportsDataManagerProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> DATA_MANAGER
     */
    func getTitle() -> String
    func getTransportsElements(completion: @escaping(Result<[Transports], ErrorResponse>) -> Void)
    func setTransportsElements(transportElements: [TransportationElementRepresentable])
    func getTransportsElements() -> [TransportationElementRepresentable]?
}

final class TransportsDataManager {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    private let useCase: TransportationsUseCase
    private var transportElements: [TransportationElementRepresentable]?
    
    // MARK: - Initialization
    
    init(useCase: TransportationsUseCase) {
        self.useCase = useCase
    }
}

extension TransportsDataManager: TransportsDataManagerProtocol {
    
    func setTransportsElements(transportElements: [TransportationElementRepresentable]) {
        self.transportElements = transportElements
    }
    
    func getTransportsElements() -> [TransportationElementRepresentable]? {
        return self.transportElements
    }
    
    func getTitle() -> String {
        
        return "TRANSPORT_VC_TITLE".localized
    }
    
    func getTransportsElements(completion: @escaping(Result<[Transports], ErrorResponse>) -> Void) {
        useCase.getElements(companyZone: "lisboa", completion: completion)
    }
    
}

