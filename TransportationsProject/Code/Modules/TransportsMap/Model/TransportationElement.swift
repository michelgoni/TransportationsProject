//
//  TransportationElement.swift
//  TransportationsProject
//
//  Created by Michel on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit
import GoogleMaps

protocol TransportationElementRepresentable {
    
    var coordinate: Coordinate {get set}
    var address: String {get set}
    var transportationType: String {get set}
    var color: UIColor {get set}
    
    func getMarker() -> GMSMarker
}

struct TransportationElement: TransportationElementRepresentable {
    
    var coordinate: Coordinate
    var address: String
    var transportationType: String
    var color: UIColor
    
    
    func getMarker() -> GMSMarker {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                 longitude: coordinate.longitude)
        let markerView = MarkerView(frame: CGRect(x: 0, y: 0, width: Constants.MarkerView.markerViewWidth,
                                                  height: Constants.MarkerView.markerViewHeight), color: color)
        marker.iconView = markerView
       
       
       
        return marker
    }
    
    
}
