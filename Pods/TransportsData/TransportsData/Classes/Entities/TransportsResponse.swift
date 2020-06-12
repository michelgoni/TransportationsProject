//
//  TransportsResponse.swift
//  TransportsData
//
//  Created by Miguel Goñi on 10/05/2020.
//

import Foundation
import TransportsUI
import TransportationDomain

public typealias TransportResponse = [TransportsResponse]

public struct TransportsResponse: Codable {
    
    public let address: String
    public let elementXPosition: Double
    public let elementYPosition: Double
    public let companyZoneId: Int
    public let longitude: Double?
    public let latitude: Double?
    public let licencePlate: String?
    public let batteryLevel: Int?
    public let model: String?
    public let pricePerMinuteParking: Int?
    public let pricePerMinuteDriving: Int?
    public let station: Bool?
    public let availableResources: Int?
    public let spacesAvailable: Int?
    public let allowDropoff: Bool?
    public let bikesAvailable: Int?
    
    public enum CodingKeys: String, CodingKey {
        
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
    
//    public enum CompanyZone: String {
//        case metro = "378"
//        case bus = "382"
//        case car = "545"
//        case electricCar = "467"
//        case electricMotorBike = "473"
//        case bike = "412"
//    }
    
    public func getAddress() -> TextConfigurableProtocol {
        
        return TextConfigurable(text: address,
                                font: fontStyle.font(forTextStyle: .body),
                                color: .black,
                                alignment: .center)
    }
    
    public func map() -> Transports {
        return Transports(transport: self)
    }
    
    public func getCompanyZone() -> CompanyZone {
        switch companyZoneId {
        case 378:
            return CompanyZone.companyZoneA
        case 382:
            return CompanyZone.companyZoneB
        case 545:
            return CompanyZone.companyZoneC
        case 467:
            return CompanyZone.companyZoneD
        case 473:
           return CompanyZone.companyZoneE
        case 412:
           return CompanyZone.companyZoneE
        default:
           return CompanyZone.companyZoneA
        }
    }
}

extension Transports {
    
    public init(transport: TransportsResponse) {
        self.init(coordinate: Coordinate(latitude: transport.elementYPosition,
                                         longitude: transport.elementXPosition), companyZone: transport.getCompanyZone())
        
    }
}

