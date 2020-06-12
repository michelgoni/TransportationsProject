//
//  Coordinate.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 27/05/2020.
//

import Foundation

public protocol CoordinateRepresentable: Codable {
    var latitude: Double { get set }
    var longitude: Double { get set }
}

public struct Coordinate: CoordinateRepresentable {
    
    public static var upperRightLatLon: Coordinate {
        return Coordinate(latitude: 38.711046, longitude: -9.160096)
    }
    
    public static var lowerLeftLatLong: Coordinate {
        return Coordinate(latitude: 38.739429, longitude: -9.137115)
    }
    
    public static var mockCoordinate: Coordinate {
        return Coordinate(latitude: 38.71395031,
                          longitude: -9.13916688)
    }
    public var latitude: Double
    public var longitude: Double
    
    public init (latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
