//
//  UILabel+Extensions.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit

extension UILabel {
    
    func configure(textConfigurable: TextConfigurableProtocol?) {
        if let textConfigurable = textConfigurable {
            text = textConfigurable.text
            font = textConfigurable.font
            textColor = textConfigurable.color
            textAlignment = textConfigurable.alignment
        } else {
            text = ""
        }
    }
    
}

