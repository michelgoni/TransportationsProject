//
//  TransportsResponse.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

typealias TransportResponse = [TransportsResponse]

struct TransportsResponse: Codable {
    
    let address: String
    let elementXPosition: Double
    let elementYPosition: Double
    let companyZoneId: Int
    let longitude: Double?
    let latitude: Double?
    let licencePlate: String?
    let batteryLevel: Int?
    let model: String?
    let pricePerMinuteParking: Int?
    let pricePerMinuteDriving: Int?
    let station: Bool?
    let availableResources: Int?
    let spacesAvailable: Int?
    let allowDropoff: Bool?
    let bikesAvailable: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case address = "name"
        case elementXPosition = "x"
        case elementYPosition = "y"
        case companyZoneId
        case latitude = "lat"
        case longitude = "lon"
        case licencePlate
        case batteryLevel
        case model
        case pricePerMinuteParking
        case pricePerMinuteDriving
        case station
        case availableResources
        case spacesAvailable
        case allowDropoff
        case bikesAvailable
    }
    
    enum CompanyZone: String {
        case metro = "378"
        case bus = "382"
        case car = "545"
        case electricCar = "467"
        case electricMotorBike = "473"
        case bike = "412"
        
        func retrieveTransportationType() -> String {
            
            switch self {
            case .metro:
                return "METRO".localized
            case .bus:
                return "BUS".localized
            case .car:
                return "CAR".localized
            case .electricCar:
                return "ELECTRIC_CAR".localized
            case .electricMotorBike:
                return "ELECTRIC_MOTORBIKE".localized
            case .bike:
                return "BIKE".localized
            }
        }
        
        func getIcon() -> UIImage {
            
            switch self {
            case .metro:
                return #imageLiteral(resourceName: "metro.png")
            case .bus:
                return #imageLiteral(resourceName: "bus.png")
            case .car:
                return #imageLiteral(resourceName: "car.png")
            case .electricCar:
                return #imageLiteral(resourceName: "electricCar.png")
            case .electricMotorBike:
                return #imageLiteral(resourceName: "electricMotorbike.png")
            case .bike:
                return #imageLiteral(resourceName: "bike.png")
                
            }
        }
        
        func enableAction() -> Bool {
            switch self {
            case .metro, .bus:
                return false
            default:
                return true
            }
        }
    }
    
    func getAddress() -> TextConfigurableProtocol {
        
        return TextStyles.detailTransportAddress(text: address)
    }
    
    func getTransportationType() -> TextConfigurableProtocol {
        return TextStyles.detailTransportTitle(text: (CompanyZone(rawValue: companyZoneId.string)?.retrieveTransportationType() ?? TextStyles.emptyTitle()))
    }
    
    func getTransportElement() -> TransportationElementRepresentable? {
        guard let transportationDetail = getTransportationDetail() else {return nil}
        
        return TransportationElement(coordinate: Coordinate(latitude: elementYPosition, longitude: elementXPosition))
    }
    
    func getTransportationDetail() -> TransportationDetailRepresentable? {
        guard let icon = CompanyZone(rawValue: companyZoneId.string)?.getIcon(),
            let action = CompanyZone(rawValue: companyZoneId.string)?.enableAction() else {return nil}
        return TransportationDetail(address: getAddress(),
                                    icon: icon,
                                    transportationType: getTransportationType(),
                                    actionEnabled: action )
    }
}

