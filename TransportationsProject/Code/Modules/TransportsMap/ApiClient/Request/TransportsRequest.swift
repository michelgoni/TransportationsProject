//
//  TransportsRequest.swift
//  TransportationsProject
//
//  Created by Miguel Goñi on 24/05/2020.
//  Copyright © 2020 Michel. All rights reserved.
//

import Foundation
import Alamofire
import TransportationApiClient
import TransportationDomain
import TransportsData

// swiftlint:disable line_length

struct TransportsRequest: APIRequest {
    
    typealias Response = TransportResponse
    
    typealias Error = ErrorResponseContainer
    
    public var resourceName: String {
        return "/tripplan/api/v1/routers"
    }
    
    public var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    public var resourcePath: String {
       
        return "/\(baseApiParams.companyZone)/resources/?upperRightLatLon=\(Coordinate.upperRightLatLon.latitude),\(Coordinate.upperRightLatLon.longitude)&lowerLeftLatLon=\(Coordinate.lowerLeftLatLong.latitude),\(Coordinate.lowerLeftLatLong.longitude)"
    }
    
    public var body: Parameters? {
        return nil
    }
    
    var adapter: RequestAdapter?

    let baseApiParams: BaseApiParams
    
    public init(baseApiParams: BaseApiParams) {
        
        self.baseApiParams = baseApiParams
    }
    
}
