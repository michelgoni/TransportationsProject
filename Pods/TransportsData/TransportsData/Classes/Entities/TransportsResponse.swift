//
//  TransportsResponse.swift
//  TransportsData
//
//  Created by Miguel Goñi on 10/05/2020.
//

import Foundation

typealias TransportResponse = [TransportsResponse]

public struct TransportsResponse: Codable {
    
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

    }
    

}

