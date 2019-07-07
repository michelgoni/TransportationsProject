//
//  TransportDetailPresenter.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit

protocol TransportDetailPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func getContent()
}

class TransportDetailPresenter {
    
    // MARK: - Public variables
    
    weak var view:TransportDetailViewProtocol?
    
    // MARK: - Private variables
    
    private var dataManager: TransportDetailDataManagerProtocol
    private var transportDetail: TransportationDetailRepresentable
    
    // MARK: - Initialization
    
    init(view:TransportDetailViewProtocol,
         dataManager: TransportDetailDataManagerProtocol,
         transportDetail: TransportationDetailRepresentable) {
        self.view = view
        self.dataManager = dataManager
        self.transportDetail = transportDetail
    }
    
    // MARK: - Private methods
    private func elementPressed(elemnt: Any?) {
        
    }
    
    private func getTransportDetailViewModel() -> ModuledModelProtocol {
        
        return TransportDetailViewModel(element: transportDetail,
                                        handler: self.elementPressed)
    }
    
    private func getTransportDetailSection(modules: [ModuledModelProtocol]) -> SectionsModuleRepresentable {
        return TransportDetailSection(elements: modules)
    }
}

extension TransportDetailPresenter: TransportDetailPresenterProtocol {
    
    func getContent() {
        
        var sections = [SectionsModuleRepresentable]()
        var modules = [ModuledModelProtocol]()
        modules.append(getTransportDetailViewModel())
        sections.append(getTransportDetailSection(modules: modules))
        view?.showSections(sections: sections)
    }
    
    
}

