//
//  ApiError.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

enum ApiError: Error {
    
    case requestFailed
    case jsonParsingFailure
    case invalidData
    case responseUnsuccessful
    
    var localizedDescription: String {
        
        switch self {
        case .requestFailed: return "Request failed"
        case .jsonParsingFailure: return "JSON Parsing failure"
        case .invalidData: return "Invalid data from server"
        case .responseUnsuccessful: return "Reponse was not what we expected uh?"
        }
    }
}
