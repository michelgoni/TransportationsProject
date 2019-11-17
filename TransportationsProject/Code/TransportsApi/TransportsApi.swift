//
//  TransportsApi.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation

class TransportsApi {
    let session: URLSession
    static let shared = TransportsApi()
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    convenience init() {
        self.init(configuration: .default)
    }
}

extension TransportsApi: ApiClient {
    
    var printsDebug: Bool {
        return true
    }
    func getTransportsList(from transportsApiCase: TransportsApiCase,
                           completion: @escaping (Result<TransportResponse?, ApiError>) -> Void) {
        let endpoint = transportsApiCase
        let request = endpoint.request
        fetch(with: request, decode: { json -> TransportResponse? in
            guard let result = json as? TransportResponse else { return  nil }
            return result
        }, completion: completion)
    }
}
