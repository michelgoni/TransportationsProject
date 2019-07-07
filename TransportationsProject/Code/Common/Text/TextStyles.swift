//
//  TextStyles.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit

struct TextStyles {
    
    static func detailTransportTitle(text: String) -> TextConfigurable {
        return TextConfigurable(text: text, font: UIFont.geogrotesqueRegular24(), color: .black, alignment: .center)
    }
    
    static func detailTransportAddress(text: String) -> TextConfigurable {
        return TextConfigurable(text: text, font: UIFont.geogrotesqueRegular17(), color: .black, alignment: .left)
    }
    
    static func emptyTitle() -> String {
        return ""
    }
}

