//
//  String+Extensions.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizeWithFormat(arguments: [CVarArg]) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
