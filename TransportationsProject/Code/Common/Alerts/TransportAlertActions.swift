//
//  TransportAlertActions.swift
//  TransportationsProject
//
//  Created by Michel on 17/11/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit

protocol Alerter: class {
    func alert(with customActions: [UIAlertAction], title: String, message: String?)
    func alert(title: String, message: String?, handler: ((UIAlertAction) -> Void)?)
}

extension UIViewController: Alerter {
    
    func alert(with customActions: [UIAlertAction], title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        customActions.forEach {( alert.addAction($0) )}
        present(alert, animated: true, completion: nil)
    }
    
    func alert(title: String, message: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK_BUTTON".localized, style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
}

