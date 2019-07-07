//
//  TransportDetailRouter.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit

class TransportDetailRouter {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    var halfModalTransitioning: HalfModalTransitioning?
    
    private var view:TransportDetailViewController {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "TransportDetail", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "TransportDetail") as? TransportDetailViewController,
            let transportDetail = transportDetail {
            let presenter: TransportDetailPresenterProtocol = TransportDetailPresenter(view: controller, dataManager: dataManager, transportDetail: transportDetail)
            controller.set(presenter: presenter)
            return controller
        }
        return TransportDetailViewController()
    }
    
    private var dataManager: TransportDetailDataManagerProtocol {
        return TransportDetailDataManager()
    }
    
    private var transportDetail: TransportationDetailRepresentable?
    
    // MARK: - Initialization
    
    init(transportDetail: TransportationDetailRepresentable? = nil) {
        self.transportDetail = transportDetail
    }
    
    // MARK: - Presentation Methods
    
    func present(viewController: UIViewController) {
        UIViewController.getCurrentViewController()?.present(viewController, animated: true, completion: nil)
    }
    
    func presentThirdHalfOfScreen(viewController: UIViewController, modalHeight: ModalHeight = .custom(value:  UIScreen.main.bounds.height / 4)) {
        
        if let current = UIViewController.getCurrentViewController() {
            halfModalTransitioning = HalfModalTransitioning(viewController: current,
                                                            presentingViewController: viewController,
                                                            modalHeight: modalHeight)
            viewController.modalPresentationStyle = .custom
            viewController.transitioningDelegate = halfModalTransitioning
        }
        present(viewController: viewController)
        
    }
    
    func getPresentationController() -> UIViewController {
        return view
    }
    
}

