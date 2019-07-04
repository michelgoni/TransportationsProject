//
//  MapPointsPosition.swift
//  TransportationsProject
//
//  Created by Michel on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapPositionsRepresentable {
    var cameraPosition: GMSCameraPosition {get set}
    var markers: [GMSMarker] {get set}
}

struct MapPointsPosition: MapPositionsRepresentable {
    var cameraPosition: GMSCameraPosition
    var markers: [GMSMarker]
}
