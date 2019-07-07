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
    var address: TextConfigurableProtocol {get set}
    var icon: UIImage {get set}
    var transportationType: TextConfigurableProtocol {get set}
    var actionEnabled: Bool {get set}
}

struct TransportationDetail: TransportationDetailRepresentable {
    
    var address: TextConfigurableProtocol
    var icon: UIImage
    var transportationType: TextConfigurableProtocol
    var actionEnabled: Bool
    
}

protocol TransportationElementRepresentable {
    
    var coordinate: Coordinate {get set}
    var transportationDetail: TransportationDetailRepresentable {get set}
    func getMarker() -> GMSMarker
    func getTransportationDetail() -> TransportationDetailRepresentable
}

struct TransportationElement: TransportationElementRepresentable {
    
    var coordinate: Coordinate
    var transportationDetail: TransportationDetailRepresentable
    
    func getMarker() -> GMSMarker {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                 longitude: coordinate.longitude)
        let markerView = MarkerView(frame: CGRect(x: 0, y: 0, width: Constants.MarkerView.markerViewWidth,
                                                  height: Constants.MarkerView.markerViewHeight),
                                    image: transportationDetail.icon)
        marker.iconView = markerView
        return marker
    }
    
    func getTransportationDetail() -> TransportationDetailRepresentable {
        
        return transportationDetail
    }
}
