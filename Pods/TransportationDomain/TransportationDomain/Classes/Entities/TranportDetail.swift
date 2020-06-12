//
//  TranportDetail.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 27/05/2020.
//

import Foundation
import TransportsUI

public protocol TransportationDetailRepresentable {
    var address: String {get set}
    //var icon: UIImage {get set}
    var transportationType: CompanyZone {get set}
//var actionEnabled: Bool {get set}
}

public struct TransportationDetail: TransportationDetailRepresentable {
    
    public var address: String
    public var transportationType: CompanyZone
    
    public init(address: String, transportationType: CompanyZone) {
        self.address = address
        self.transportationType = transportationType
    }
    
    
}

