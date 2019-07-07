//
//  TransportDetailSection.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

class  TransportDetailSection: SectionsModuleRepresentable {
    var elements: [ModuledModelProtocol]
    
    init(elements: [ModuledModelProtocol]) {
        self.elements = elements
    }
}
