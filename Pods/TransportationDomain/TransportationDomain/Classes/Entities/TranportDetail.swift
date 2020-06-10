//
//  TranportDetail.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 27/05/2020.
//

import Foundation
import TransportsUI

public protocol TransportationDetailRepresentable {
    var address: TextConfigurableProtocol {get set}
    var icon: UIImage {get set}
    var transportationType: TextConfigurableProtocol {get set}
    var actionEnabled: Bool {get set}
}

