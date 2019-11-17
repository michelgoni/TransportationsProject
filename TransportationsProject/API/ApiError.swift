//
//  ApiError.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

enum ApiError: Error, LocalizedError {
    
    case requestFailed
    case jsonParsingFailure
    case invalidData
    case responseUnsuccessful
    case custom(code: Int, message: String)
    
    var errorDescription: String {

        switch self {
        case .requestFailed: return "Request failed"
        case .jsonParsingFailure: return "JSON Parsing failure"
        case .invalidData: return "Invalid data from server"
        case .responseUnsuccessful: return "Reponse was not what we expected, uh?"
        case .custom(code: _, message: let message): return message
            
        }
    }
}

