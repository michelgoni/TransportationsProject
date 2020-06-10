//
//  TransportsRequest.swift
//  TransportsData
//
//  Created by Miguel Goñi on 03/06/2020.
//

import Foundation
import TransportationApiClient
import Alamofire
import TransportationDomain

public class TransportsRequest: APIRequest {
    
    public typealias Response = [TransportsResponse]
    
    public typealias Error = ErrorResponseContainer
    
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
    
    public var adapter: RequestAdapter?

    let baseApiParams: BaseApiParams
    
    public init(baseApiParams: BaseApiParams) {
        
        self.baseApiParams = baseApiParams
    }
    
}
