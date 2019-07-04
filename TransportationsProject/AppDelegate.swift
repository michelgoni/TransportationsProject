//
//  AppDelegate.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupGoogleMaps()
        window = UIWindow(frame: UIScreen.main.bounds)
        TransportsRouter().show(from: window)
        
        return true
    }
    
    private func setupGoogleMaps() {
        GMSServices.provideAPIKey(Constants.GoogleMaps.googleMapsApiKey)
        
    }
    
    
    
}

