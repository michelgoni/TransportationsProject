//
//  UIColor+Extensions.swift
//  TransportationsProject
//
//  Created by Michel Goñi on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
     func image(_ size: CGSize = CGSize(width: 35, height: 35)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}
