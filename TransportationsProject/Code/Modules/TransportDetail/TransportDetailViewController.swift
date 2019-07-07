//
//  TransportDetailViewController.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit

protocol TransportDetailViewProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: TransportDetailPresenterProtocol)
    func showSections(sections: [SectionsModuleRepresentable])
}

class TransportDetailViewController: UIViewController {
    
    // MARK: - Public properties
    @IBOutlet var tvDetailTransport: UITableView!
    
    // MARK: - Private properties
    private let elementsDataSource = ElementsDataSource()
    private var presenter:TransportDetailPresenterProtocol?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getContent()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
    private func configureTableView() {
        tvDetailTransport.dataSource = elementsDataSource
        tvDetailTransport.delegate = elementsDataSource
        tvDetailTransport.register(TransportDetailTableViewCell.self)
        tvDetailTransport.estimatedRowHeight = 90.0
        tvDetailTransport.rowHeight = UITableView.automaticDimension
        
    }
    
}

// MARK: - TransportDetailViewProtocol

extension TransportDetailViewController:  TransportDetailViewProtocol {
    
    func set(presenter: TransportDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func showSections(sections: [SectionsModuleRepresentable]) {
         elementsDataSource.setDataSource(elements: sections)
        tvDetailTransport.reloadData()
    }
    
}
