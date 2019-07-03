//
//  TransportsResponse.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

typealias TransportResponse = [TransportsResponse]

struct TransportsResponse: Codable {
    
    
    let id, name: String
    let x, y: Double
    let companyZoneId: Int
    let lon, lat: Double?
    let licencePlate: String?
    let range, batteryLevel, seats: Int?
    let model: String?
    let resourceImageId: String?
    let pricePerMinuteParking, pricePerMinuteDriving: Int?
    let realTimeData: Bool?
    let engineType: String?
    let resourceType: String?
    let helmets: Int?
    let station: Bool?
    let availableResources, spacesAvailable: Int?
    let allowDropoff: Bool?
    let bikesAvailable: Int?
}

