//
//  Enviroment.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

struct Environment {
    
    private static let typeFileEnvironment = "plist"
    private static let nameFileEnvironment = "Info"
    private static let isMockKey = "isMock"
    
    private var plistEnvironment : [String: Any] = [:]
    
    // MARK: - Init
    
    private init() {
        if let plist = Bundle.main.infoDictionary {
            plistEnvironment = plist
        }
    }
    
    // MARK: - Shared Instance
    
    static let shared = Environment()
    
    var isMock: Bool {
        return plistEnvironment[Environment.isMockKey] as? Bool ?? false
    }
}
