//
//  Transports.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 17/05/2020.
//

import Foundation

public protocol TransportationElementRepresentable {
    
    var coordinate: Coordinate { get set }
}

public struct Transports: TransportationElementRepresentable {
    public var coordinate: Coordinate
   
    
    public init(coordinate: Coordinate) {
        self.coordinate = coordinate
    }
    
}
