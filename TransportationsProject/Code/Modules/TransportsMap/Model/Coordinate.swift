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
    
      static var upperRightLatLon: Coordinate {
         return Coordinate(latitude: 38.711046, longitude: -9.160096)
     }
     
     static var lowerLeftLatLong: Coordinate {
         return Coordinate(latitude: 38.739429, longitude: -9.137115)
     }
    
    static var mockCoordinate: Coordinate {
        return Coordinate(latitude: Constants.MockCoordinates.mockLatitude,
                          longitude: Constants.MockCoordinates.mockLongitude)
    }
    var latitude: Double
    var longitude: Double
}
