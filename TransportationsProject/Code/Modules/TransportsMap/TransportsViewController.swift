//
//  TransportsViewController.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import GoogleMaps

protocol TransportsViewProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: TransportsPresenterProtocol)
    func showUserLocation(mapPoints: MapPointsPosition)
}

class TransportsViewController: UIViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var mapView: GMSMapView!
    // MARK: - Private properties
    
    private var presenter:TransportsPresenterProtocol?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
    
}

// MARK: - TransportsViewProtocol

extension TransportsViewController:  TransportsViewProtocol {
    
    
    func set(presenter: TransportsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func showUserLocation(mapPoints: MapPointsPosition) {
        mapView.delegate = self
        mapView.clear()
        mapView.camera = mapPoints.cameraPosition
       
       mapPoints.markers.forEach({$0.map = mapView})
    }
    
}

extension TransportsViewController: GMSMapViewDelegate {
    
    
}
