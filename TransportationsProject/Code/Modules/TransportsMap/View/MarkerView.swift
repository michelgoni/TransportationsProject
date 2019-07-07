//
//  MarkerView.swift
//  TransportationsProject
//
//  Created by Michel on 04/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import Foundation
import UIKit

class MarkerView: UIView {
   
    var image: UIImage
    
    init(frame: CGRect, image: UIImage) {
        
        self.image = image
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        //let img = color.image(CGSize(width: frame.width, height: frame.height))
        let imgView = UIImageView(image: image)
        imgView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        imgView.layer.cornerRadius = imgView.frame.width / 2
        imgView.layer.borderColor = UIColor.black.cgColor
        imgView.layer.borderWidth = 1
        imgView.clipsToBounds = true
       
        self.addSubview(imgView)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
