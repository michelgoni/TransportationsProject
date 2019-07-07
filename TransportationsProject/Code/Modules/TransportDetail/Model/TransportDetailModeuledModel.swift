//
//  TransportDetailModeuledModel.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit


class TransportDetailViewModel: ModuledModelProtocol {
    
    var height: CGFloat = 150
    
    var isClickable: Bool = true
    
    var cellType: UITableViewCell.Type = TransportDetailTableViewCell.self
    
    var handler: ((Any?) -> Void)?
    
    var element: TransportationDetailRepresentable
    
    init(element: TransportationDetailRepresentable,  handler: ((Any?) -> Void)?) {
        self.element = element
        self.handler = handler
    }
    
    
    
}
