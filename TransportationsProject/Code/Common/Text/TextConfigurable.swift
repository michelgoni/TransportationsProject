//
//  TextConfigurable.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit

protocol TextConfigurableProtocol {
    var text: String { get set }
    var font: UIFont { get set }
    var color: UIColor { get set }
    var alignment: NSTextAlignment { get set }
    
}

struct TextConfigurable: TextConfigurableProtocol {
    var text: String
    var font: UIFont
    var color: UIColor
    var alignment: NSTextAlignment
    
}
