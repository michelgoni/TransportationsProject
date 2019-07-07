//
//  TransportationElement.swift
//  TransportationsProject
//
//  Created by Michel on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit
import GoogleMaps

protocol TransportationDetailRepresentable {
    var address: String {get set}
    var icon: UIImage {get set}
    var transportationType: String {get set}
    var actionEnabled: Bool {get set}
}

struct TransportationDetail: TransportationDetailRepresentable{
    
    var address: String
    var icon: UIImage
    var transportationType: String
    var actionEnabled: Bool
    
    
}

protocol TransportationElementRepresentable {
    
    var coordinate: Coordinate {get set}
    var color: UIColor {get set}
    
    func getMarker() -> GMSMarker
}

struct TransportationElement: TransportationElementRepresentable {
    
    var coordinate: Coordinate
    var color: UIColor
    var transportationDetail: TransportationDetailRepresentable
    
    
    func getMarker() -> GMSMarker {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                 longitude: coordinate.longitude)
        let markerView = MarkerView(frame: CGRect(x: 0, y: 0, width: Constants.MarkerView.markerViewWidth,
                                                  height: Constants.MarkerView.markerViewHeight), color: color)
        marker.userData = ["transportationType": transportationDetail.transportationType,
                           "transportatioaddress": transportationDetail.address,
                           "transportatioactionEnabled": transportationDetail.actionEnabled,
                           "transportationIcon": transportationDetail.icon]
        marker.iconView = markerView
        
       
       
       
        return marker
    }
    
    
}
