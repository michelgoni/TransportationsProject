//
//  Transports.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 17/05/2020.
//

import Foundation

public enum CompanyZone {
    case companyZoneA, companyZoneB, companyZoneC, companyZoneD, companyZoneE, companyZoneUnknown
}

public protocol TransportationElementRepresentable {
    
    var coordinate: Coordinate { get set }
    var companyZone: CompanyZone { get }
}

public struct Transports: TransportationElementRepresentable {
    public var coordinate: Coordinate
    public var companyZone: CompanyZone
    
    public init(coordinate: Coordinate, companyZone: CompanyZone ) {
        self.coordinate = coordinate
        self.companyZone = companyZone
    }
}
