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
        
        
        func retrieveColor() -> UIColor {
            
            switch self {
            case .metro:
                return .blue
            case .bus:
                return .brown
            case .car:
                return .red
            case .electricCar:
                return .green
            case .electricMotorBike:
                return .yellow
            case .bike:
                return .black
            }
        }
        
        func retrieveTransportationType() -> String {
            
            switch self {
            case .metro:
                return "Metro"
            case .bus:
                return "Bus"
            case .car:
                return "Car"
            case .electricCar:
                return "Electric car"
            case .electricMotorBike:
                return "Electric motorbike"
            case .bike:
                return "Bike"
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
    
    func getTransportElement() -> TransportationElementRepresentable? {
        

        guard let color = CompanyZone(rawValue: companyZoneId.string)?.retrieveColor(),
        let transportationDetail = getTransportationDetail() else {return nil}
        
        
        return TransportationElement(coordinate: Coordinate(latitude: elementYPosition, longitude: elementXPosition),
                                     color: color,
                                     transportationDetail: transportationDetail)
    }
    
    func getTransportationDetail() -> TransportationDetailRepresentable? {
        guard let transportationType = CompanyZone(rawValue: companyZoneId.string)?.retrieveTransportationType(),
        let icon = CompanyZone(rawValue: companyZoneId.string)?.getIcon(),
        let action = CompanyZone(rawValue: companyZoneId.string)?.enableAction() else {return nil}
        return TransportationDetail(address: address, icon: icon, transportationType: transportationType, actionEnabled: action )
    }
    
   
   
    

    
  
}

