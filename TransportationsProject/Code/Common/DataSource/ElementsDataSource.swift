//
//  ElementsDataSource.swift
//  TransportationsProject
//
//  Created by Michel on 07/07/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit

class ElementsDataSource: NSObject {
    
    private var elements: [SectionsModuleRepresentable]?
    
    func setDataSource(elements: [SectionsModuleRepresentable]) {
        self.elements = elements
    }
}

extension ElementsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements?[section].elements.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let element = elements?[indexPath.section].elements[indexPath.row] else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath, type: element.cellType)
        if let configurableCell = cell as? ConfigurableModuledModel {
            configurableCell.configure(element: element)
        }
        return cell
    }
    
}

extension ElementsDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let element = elements?[indexPath.section].elements[indexPath.row] else {return}
        element.handler?(element)
        
    }
    
}
