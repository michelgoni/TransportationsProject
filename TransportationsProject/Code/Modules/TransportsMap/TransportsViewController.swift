//
//  TransportsViewController.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import GoogleMaps

protocol RetryableProtocol {
    func retry()
}

protocol TransportsViewProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: TransportsPresenterProtocol)
    func showLoadingActivityIndicator()
    func hideLoadingActivityIndicator()
    func showError(message: String)
    func showUserLocation(mapPoints: MapPointsPosition)
    func showTitle(title: String)
}

class TransportsViewController: UIViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var mapView: GMSMapView!
    var loadingScreen = ActivityIndicatorScreen()
    // MARK: - Private properties
    
    private var presenter:TransportsPresenterProtocol?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getContent()
        presenter?.getTitle()
    }
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
    
}

// MARK: - TransportsViewProtocol

extension TransportsViewController:  TransportsViewProtocol {
    
    func showLoadingActivityIndicator() {
        loadingScreen.show(view: view)
        
    }
    
    func hideLoadingActivityIndicator() {
        loadingScreen.hide(completion: nil)
    }
    
    func set(presenter: TransportsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "ERROR_TITLE".localized, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK_BUTTON".localized, style: .default, handler: { _ in
            self.retry()
        }))
        DispatchQueue.main.async { self.present(alert, animated: true) }
    }
    
    func showUserLocation(mapPoints: MapPointsPosition) {
        mapView.delegate = self
        mapView.clear()
        mapView.camera = mapPoints.cameraPosition
        mapPoints.markers.forEach({$0.map = mapView})
    }
    
    func showTitle(title: String) {
        self.title = title
    }
}

extension TransportsViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let coordinate = Coordinate(latitude: marker.position.latitude,
                                    longitude: marker.position.longitude)
        presenter?.markerTapped(coordinate: coordinate)
        
        return false
    }
}

extension TransportsViewController: RetryableProtocol {
    func retry() {
        presenter?.getContent()
    }
}
