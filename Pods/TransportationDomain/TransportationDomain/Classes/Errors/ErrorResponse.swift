//
//  ErrorResponse.swift
//  TransportationDomain
//
//  Created by Miguel Goñi on 23/05/2020.
//

import Foundation


public struct ErrorResponseContainer: Decodable {
    public let error: ErrorResponse
}

public struct ErrorResponse: Decodable, Error {
   
    let internalMessage: String
    
    public static func generic(error: Error? = nil) -> ErrorResponse {
        return ErrorResponse(internalMessage: error?.localizedDescription ?? "Unknown error")
    }
    
   public var errorString: String {
        return "\(internalMessage)"
    }
}

