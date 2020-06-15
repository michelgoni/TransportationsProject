//
//  TransportMapViewModel.swift
//  TransportationsProject
//
//  Created by Miguel Goñi on 13/06/2020.
//  Copyright © 2020 Michel. All rights reserved.
//

import Foundation
import Action
import TransportationDomain

protocol TransportMapViewModelProtocol {
    var getTransports: Action<String, Transports> { get }
}

class TransportMapViewModel: TransportMapViewModelProtocol {
    

    var useCase: TransportationsUseCase
    
    required init (useCase: TransportationsUseCase) {
        self.useCase = useCase
    }
    
    lazy var getTransports: Action<String, Transports> = { this in
        
        Action<String, Transports> { companyZone in
            
            return this.useCase.getElements(companyZone: <#T##String#>, completion: <#T##(Result<[Transports], ErrorResponse>) -> Void#>)
        }
        
    }(self)
}
