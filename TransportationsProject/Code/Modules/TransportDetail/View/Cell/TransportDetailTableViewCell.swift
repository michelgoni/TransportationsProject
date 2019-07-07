//
//  TransportDetailTableViewCell.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit

protocol ConfigurableModuledModel {
    func configure(element: ModuledModelProtocol)
}

class TransportDetailTableViewCell: UITableViewCell, ConfigurableModuledModel {
  

    @IBOutlet var lbDetailTransportTitle: UILabel!
    @IBOutlet var imgLbDetailTransport: UIImageView!
    @IBOutlet var lbAddressDetailTransport: UILabel!
    
    // MARK: -ConfigurableModuledModel
    func configure(element: ModuledModelProtocol) {
        
        if let detailTransportElement = element as? TransportDetailViewModel {
            configureImg(detailTransportImage: detailTransportElement.element.icon)
            configureDetailTransportTitle(detailTransportTitle: detailTransportElement.element.transportationType)
            configureDetailTransportAddress(detailTransportAddress: detailTransportElement.element.address)
        }
    }
    
    
    // MARK: - Private methods
    private func configureImg(detailTransportImage: UIImage) {
        imgLbDetailTransport.layer.cornerRadius = imgLbDetailTransport.frame.width / 2
        imgLbDetailTransport.layer.masksToBounds = true
        imgLbDetailTransport.clipsToBounds = true
        imgLbDetailTransport.layer.borderWidth = 0.6
        imgLbDetailTransport.layer.borderColor = UIColor.black.cgColor
        imgLbDetailTransport.image = detailTransportImage
    }
    
    private func configureDetailTransportTitle(detailTransportTitle: TextConfigurableProtocol) {
        lbDetailTransportTitle.configure(textConfigurable: detailTransportTitle)
    }
    
    private func configureDetailTransportAddress(detailTransportAddress: TextConfigurableProtocol) {
        lbAddressDetailTransport.configure(textConfigurable: detailTransportAddress)
    }
    
    
}
