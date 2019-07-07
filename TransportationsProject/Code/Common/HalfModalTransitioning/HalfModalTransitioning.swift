//
//  HalfModalTransitioningDelegate.swift
//  HalfModalPresentationController
//
//  Created by Martin Normark on 17/01/16.
//  Copyright © 2016 martinnormark. All rights reserved.
//

import UIKit

public class HalfModalTransitioning: NSObject, UIViewControllerTransitioningDelegate {
    var viewController: UIViewController
    var presentingViewController: UIViewController
    var interactionController: HalfModalInteractiveTransition
    let modalHeight: ModalHeight
    
    var interactiveDismiss = true
    
    public init(viewController: UIViewController,
                presentingViewController: UIViewController,
                modalHeight: ModalHeight) {
        self.viewController = viewController
        self.presentingViewController = presentingViewController
        self.interactionController = HalfModalInteractiveTransition(viewController: self.viewController,
                                                                    withView: self.presentingViewController.view,
                                                                    presentingViewController: self.presentingViewController)
        self.modalHeight = modalHeight
        
        super.init()
    }
    
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HalfModalTransitionAnimator(type: .dismiss)
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfModalPresentationController(presentedViewController: presented,
                                               presenting: presenting,
                                               modalHeight: modalHeight)
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if interactiveDismiss {
            return self.interactionController
        }
        
        return nil
    }
    
}

extension UIViewController { }
