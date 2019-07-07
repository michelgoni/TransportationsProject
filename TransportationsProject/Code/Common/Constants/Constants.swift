//
//  Constants.swift
//  TransportationsProject
//
//  Created by Michel on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct MockQueryitems {
        static let firstQueryItem = "38.711046,-9.160096"
        static let secondQueryItem = "38.739429,-9.137115"
    }
    
    struct MockCoordinates {
        static let mockLatitude: Double = 38.71395031
        static let mockLongitude: Double = -9.13916688
    }
    
    struct MarkerView {
        static let markerViewWidth: CGFloat = 35.0
        static let markerViewHeight: CGFloat = 35.0
    }
    
    struct GoogleMaps {
        static let googleMapsApiKey = "AIzaSyDfiT1Y67eduO2tqLEhf2F68fNOOu_pCuU"
    }
}
