//
//  Coordinate.swift
//  TransportationsProject
//
//  Created by Michel on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

protocol CoordinateRepresentable: Codable {
    var latitude: Double { get set }
    var longitude: Double { get set }
}

struct Coordinate: CoordinateRepresentable {
    
    static var mockCoordinate: Coordinate { 
        return Coordinate(latitude: 38.71395031, longitude: -9.13916688)
    }
    var latitude: Double
    var longitude: Double
}
