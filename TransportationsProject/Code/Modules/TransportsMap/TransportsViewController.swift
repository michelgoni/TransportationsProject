//
//  TransportsViewController.swift
//  TransportationsProject
//
//  Created by Michel on 03/07/2019.
//  Copyright (c) 2019 Michel. All rights reserved.
//

import UIKit

protocol TransportsViewProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: TransportsPresenterProtocol)
}

class TransportsViewController: UIViewController {
    
    // MARK: - Public properties
    
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
    
}
