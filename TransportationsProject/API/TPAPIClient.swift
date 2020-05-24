//
//  TPAPIClient.swift
//  TransportationsProject
//
//  Created by Miguel Goñi on 24/05/2020.
//  Copyright © 2020 Michel. All rights reserved.
//

import Foundation
import TransportationApiClient
import TransportationDomain

public class TPAPIClient: APIClient {
    
    static let shared = TPAPIClient( printsDebug: true)
    
    override public var baseEndpoint: String {
        return "https://apidev.meep.m"
    }
    
    public func sendServer<T: APIRequest>(_ request: T, success: @escaping (T.Response) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        send(request, success: success) { (serverError: ServerError) in
            var error: ErrorResponse = ErrorResponse.generic()
            if let clientError = serverError.clientError as? ErrorResponseContainer {
                error = clientError.error
            } else if let rawError = serverError.rawError {
                error = ErrorResponse.generic(error: rawError)
            }
            failure(error)
        }
    }
}
