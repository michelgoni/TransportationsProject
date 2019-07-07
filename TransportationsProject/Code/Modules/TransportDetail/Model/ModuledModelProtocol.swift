//
//  ModuledModelProtocol.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

import UIKit

protocol ModuledModelProtocol {
    var height: CGFloat { get }
    var isClickable: Bool { get }
    var cellType: UITableViewCell.Type { get }
    var handler: ((Any?) -> Void)? { get set }
}


protocol SectionsModuleRepresentable {
    var elements: [ModuledModelProtocol] { get set }
}
