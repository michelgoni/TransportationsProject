//
//  TransportsRepository.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 17/05/2020.
//

import Foundation


public protocol TransportRepository {
    func getElements(companyZone: String, completion: @escaping (Result<[Transports], ErrorResponse>) -> Void)
}