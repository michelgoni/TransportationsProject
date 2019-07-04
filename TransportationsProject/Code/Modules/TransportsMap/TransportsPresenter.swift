//
//  TransportsPresenter.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import GoogleMaps

protocol TransportsPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func getContent()
}

class TransportsPresenter {
    
    // MARK: - Public variables
    
    weak var view:TransportsViewProtocol?
    
    // MARK: - Private variables
    
    private var dataManager: TransportsDataManagerProtocol
    
    // MARK: - Initialization
    
    init(view:TransportsViewProtocol,
         dataManager: TransportsDataManagerProtocol) {
        self.view = view
        self.dataManager = dataManager
    }
    
    //MARK: - Private methods
    private func buildMapPoints(mapPoints: MapPointsModel) -> MapPointsPosition? {
        
        let cameraPosition = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: mapPoints.coordinate.latitude,
                                                                              longitude: mapPoints.coordinate.longitude),
                                               zoom: 15,
                                               bearing: 0,
                                               viewingAngle: 0)
        

        let markers = mapPoints.transportElements.map { element -> GMSMarker in
            
            return element.getMarker()
        }
        return MapPointsPosition(cameraPosition: cameraPosition, markers: markers)

        
    }
}

extension TransportsPresenter: TransportsPresenterProtocol {
    func getContent() {
        dataManager.getTransports { (result) in
            switch result {
            case .success(let transports):
                guard let transports = transports else {return}
                
                let transportElements = transports.compactMap{ element -> TransportationElementRepresentable? in
                    
                    return element.getTransportElement()
                    
                }
                let mapPointsModel = MapPointsModel(transportElements: transportElements, coordinate: Coordinate.mockCoordinate)
                guard let mapPoints = self.buildMapPoints(mapPoints: mapPointsModel) else {return}
                self.view?.showUserLocation(mapPoints: mapPoints)
               
                
             
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    
    
}

