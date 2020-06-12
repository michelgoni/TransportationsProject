//
//  TransportationElement.swift
//  TransportationsProject
//
//  Created by Michel on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit
import GoogleMaps
import TransportationDomain
import TransportsUI

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
    
    var transport: Transports {get set}
    // var transportationDetail: TransportationDetailRepresentable {get set}
    func getMarker() -> GMSMarker
    func getTransportationDetail() -> TransportationDetailRepresentable
}

struct TransportationElement: TransportationElementRepresentable {
    
    var transport: Transports
    // var transportationDetail: TransportationDetailRepresentable
    
    func getMarker() -> GMSMarker {
        
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: transport.coordinate.latitude,
                                                 longitude: transport.coordinate.longitude)
        let markerView = MarkerView(frame: CGRect(x: 0, y: 0, width: Constants.MarkerView.markerViewWidth,
                                                  height: Constants.MarkerView.markerViewHeight),
                                    image: transport.getCompanyZoneIcon()) 
        marker.iconView = markerView
        return marker
    }
    
        func getTransportationDetail() -> TransportationDetailRepresentable {
    
            return TransportationDetail(address: TextConfigurable(text: transport.transportationDetail.address,
                                                                  font: fontStyle.font(forTextStyle: .body),
                                                                  color: .black,
                                                                  alignment: .left),
                                        icon: transport.getCompanyZoneIcon(),
                                        transportationType: TextConfigurable(text: transport.retrieveTransportationType(),
                                                                             font: fontStyle.font(forTextStyle: .body),
                                                                             color: .black,
                                                                             alignment: .left),
                                        actionEnabled: true)
        }
}

extension Transports {
    
    func getCompanyZoneIcon() -> UIImage {
        switch companyZone {
        case .companyZoneA:
            return #imageLiteral(resourceName: "bike.png")
        case .companyZoneB:
            return #imageLiteral(resourceName: "bus.png")
        case .companyZoneC:
            return #imageLiteral(resourceName: "car.png")
        case .companyZoneD:
            return #imageLiteral(resourceName: "electricCar.png")
        case .companyZoneE:
            return #imageLiteral(resourceName: "electricMotorbike.png")
        case .companyZoneUnknown:
            return #imageLiteral(resourceName: "motorbike.png")
            
        }
    }
    
    func retrieveTransportationType() -> String {
        
        switch companyZone {
        case .companyZoneA:
            return "METRO".localized
        case .companyZoneB:
            return "BUS".localized
        case .companyZoneC:
            return "CAR".localized
        case .companyZoneD:
            return "ELECTRIC_CAR".localized
        case .companyZoneE:
            return "ELECTRIC_MOTORBIKE".localized
        case .companyZoneUnknown:
            return "BIKE".localized
        }
    }
}

