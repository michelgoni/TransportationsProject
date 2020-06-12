//
//  TransportsRouter.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit
import TransportationDomain
import TransportsData
import TransportationApiClient

final class TransportsRouter {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private var view:TransportsViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Transports", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "Transports") as? TransportsViewController {
            let presenter: TransportsPresenterProtocol = TransportsPresenter(view: controller, dataManager: dataManager)
            controller.set(presenter: presenter)
            return controller
        }
        return TransportsViewController()
    }
    
    private var dataManager: TransportsDataManagerProtocol {
        return TransportsDataManager(useCase: useCase)
    }
    
    private var apiService: TransportsApiService {
        return TransportsApiServiceImplm(apiService: TPAPIClient() )
    }
    
    private var repository: TransportRepository {
        return TransportsRepositoryImplm(apiService: apiService)
    }
    
    private var useCase: TransportationsUseCase {
        return TransportationsUseCaseImpl(repository: repository)
    }
    
    // MARK: - Initialization
    
    init() {}
    
    // MARK: - Presentation Methods
    
    func show(from windwow: UIWindow?) {
        let navigationController = UINavigationController(rootViewController: view)
        windwow?.rootViewController = navigationController
        windwow?.makeKeyAndVisible()
    }
}

