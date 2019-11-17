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
    func getTitle()
    func markerTapped(coordinate: Coordinate)
}

final class TransportsPresenter {
    
    // MARK: - Public variables
    
    weak var view:TransportsViewProtocol?
    
    // MARK: - Private variables
    
    private var dataManager: TransportsDataManagerProtocol
    private var transportElements: [TransportationElementRepresentable]?
    
    // MARK: - Initialization
    
    init(view:TransportsViewProtocol,
         dataManager: TransportsDataManagerProtocol) {
        self.view = view
        self.dataManager = dataManager
    }
    
    // MARK: - Private methods
    private func buildMapPoints(mapPoints: MapPointsModel) -> MapPointsPosition? {
        
        let cameraPosition = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: mapPoints.coordinate.latitude,
                                                                              longitude: mapPoints.coordinate.longitude),
                                               zoom: 17,
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
        
        view?.showLoading()
        
        dataManager.getTransports { [weak self] result in
            guard let self = self else {return}
            self.view?.hideLoading()
            switch result {
            case .success(let transports):
                guard let transports = transports else {return}
                
                let transportElements = transports.compactMap { element -> TransportationElementRepresentable? in
                    return element.getTransportElement()
                    
                }
                self.transportElements = transportElements
                let mapPointsModel = MapPointsModel(transportElements: transportElements, coordinate: Coordinate.mockCoordinate)
                
                guard let mapPoints = self.buildMapPoints(mapPoints: mapPointsModel) else {return}
                self.view?.showUserLocation(mapPoints: mapPoints)
                
            case .failure(let error):
                self.view?.hideLoading()
                self.view?.alert(title: "ERROR_TITLE".localized,
                                 message: error.localizedDescription,
                                 handler: { _ in
                    self.getContent()
                })
              
            }
        }
    }
    
    func getTitle() {
        view?.showTitle(title: dataManager.getTitle())
    }
    
    func markerTapped(coordinate: Coordinate) {
        
        guard let transportDetail = transportElements?
            .first(where: { $0.coordinate.latitude == coordinate.latitude
                && $0.coordinate.longitude == coordinate.longitude})?
            .getTransportationDetail() else {return}
        let transportDetailViewController = TransportDetailRouter(transportDetail: transportDetail).getPresentationController()
        TransportDetailRouter().presentThirdHalfOfScreen(viewController: transportDetailViewController)
    }
}
