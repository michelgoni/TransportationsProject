//
//  AlertActions.swift
//  TransportationsProject
//
//  Created by Michel on 17/11/2019.
//  Copyright © 2019 Michel. All rights reserved.
//

import UIKit

final class AlertActions: UIAlertAction {
    
    private var handler: ((UIAlertAction) -> Void)?
    static func defaultAction(title: String? = "OK_BUTTON".localized, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) -> AlertActions {
        let action = AlertActions(title: title,
                                  style: style,
                                  handler: handler)
        action.handler = handler
        return action
    }
    
}

