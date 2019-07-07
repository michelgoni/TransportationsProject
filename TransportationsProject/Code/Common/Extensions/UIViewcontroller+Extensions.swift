//
//  UIViewcontroller+Extensions.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func getCurrentNavigationController() -> UINavigationController? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let window = appDelegate.window
        let rootController = window?.rootViewController
        
        if let navigationController = rootController?.presentedViewController as? UINavigationController {
            return navigationController
        } else if let rootController = rootController as? UINavigationController {
            return rootController
        } else if let rootController = rootController as? UITabBarController,
            let controller = rootController.selectedViewController as? UINavigationController {
            return controller
        }
        
        return nil
    }
    
    static func getCurrentViewController() -> UIViewController? {
        
        if let nav = UIViewController.getCurrentNavigationController() {
            return nav.viewControllers.last
        } else if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let window = appDelegate.window
            return window?.rootViewController
        }
        
        return nil
    }
}
