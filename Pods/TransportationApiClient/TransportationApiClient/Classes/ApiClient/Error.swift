//
//  Error.swift
//  TransportationApiClient
//
//  Created by Miguel Goñi on 19/05/2020.
//

import Foundation

public struct ServerError {
    public let rawError: Error?
    public let clientError: Any?
}
