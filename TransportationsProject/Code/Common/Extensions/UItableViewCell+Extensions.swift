//
//  UItableViewCell+Extensions.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UITableView {
    
    func register<T: UITableViewCell>(_ :T.Type) {
        
        register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell(forIndexPath indexPath: IndexPath, type: UITableViewCell.Type) -> UITableViewCell {
        
        let cell = dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath)
        object_setClass(cell, type)
        return cell
    }
}

