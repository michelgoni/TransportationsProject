//
//  BaseViewController.swift
//  TransportationsProject
//
//  Created by Michel on 17/11/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewProtocol: Alerter {
    func showTitle(title: String)
    func showLoading()
    func hideLoading()
    func hideLoading(completion: (() -> Void)?)
}

class BaseViewController: UIViewController {
    var loadingScreen = ActivityIndicatorScreen()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let message = "Showing " + NSStringFromClass(self.classForCoder)
        debugPrint(message)
    }
    
    // MARK: BaseViewProtocol
    
    func showTitle(title: String) {
        self.title = title
    }
    
    func showLoading() {
        
        loadingScreen.show(view: view)
    }
    
    func hideLoading() {
        hideLoading(completion: nil)
    }
    
    // MARK: - Class functions
    
    func hideLoading(completion: (() -> Void)? = nil) {
        loadingScreen.hide(completion: completion)
        
    }
}
