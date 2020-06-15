//
//  TransportsRepository.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 17/05/2020.
//

import Foundation
import RxSwift


public protocol TransportRepository {
    func getElements(companyZone: String, completion: @escaping (Result<[Transports], ErrorResponse>) -> Void)
    func getTrasportElements(companyZone: String)-> Single<Result<[Transports], ErrorResponse>>
}
