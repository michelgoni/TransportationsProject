//
//  HomeApiClientMock.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit

//TODO-Remove sin we´re going to have test

//class TransportsApiClientMock: TransportsApiClientProtocol {
//    
//    func getTransports(firstQueryitem: String, secondQueryItem: String, completion: @escaping (Result<TransportResponse?, ApiError>) -> Void) {
//        
//        if let path = Bundle.main.path(forResource: "transports", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let response = try JSONDecoder().decode(TransportResponse.self, from: data)
//                completion(.success(response))
//            } catch {
//                completion(.failure(.jsonParsingFailure))
//            }
//        }
//        
//    }
//}
