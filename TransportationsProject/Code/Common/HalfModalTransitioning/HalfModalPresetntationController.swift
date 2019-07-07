//
//  HalfModalPresentationController.swift
//  HalfModalPresentationController
//
//  Created by Martin Normark on 17/01/16.
//  Copyright © 2016 martinnormark. All rights reserved.
//

import UIKit

public enum ModalScaleState {
    case adjustedOnce
    case normal
}

public enum ModalHeight {
    case half
    case third
    case custom(value: CGFloat)
    
    func getHeight(from height: CGFloat) -> CGFloat {
        
        switch self {
        case .half:
            return height/2
        case .third:
            return height/3
        case .custom(let value):
            return value
        }
    }
    
    func getOriginY(from height: CGFloat) -> CGFloat {
        
        switch self {
        case .half:
            return height - height/2
        case .third:
            return height - height/3
        case .custom(let value):
            return height - value
        }
    }
}

public enum DimmingViewType {
    case blur
    case transparent
}

class HalfModalPresentationController : UIPresentationController {
    var isMaximized: Bool = false
    
    var optionalDimmingView: UIView?
    var panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer()
    var direction: CGFloat = 0
    var state: ModalScaleState = .normal
    let modalHeight: ModalHeight
    let dimmingViewType: DimmingViewType
    var dimmingView: UIView {
        if let dimmedView = optionalDimmingView {
            return dimmedView
        }
        guard let containerView = containerView else {
            return UIView()
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height))
        
        switch dimmingViewType {
        case .blur:
            // Blur Effect
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            view.addSubview(blurEffectView)
            
            // Vibrancy Effect
            let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
            let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
            vibrancyEffectView.frame = view.bounds
            
            // Add the vibrancy view to the blur view
            blurEffectView.contentView.addSubview(vibrancyEffectView)
        case .transparent:
            view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        }
        
        let touchGesture = UITapGestureRecognizer()
        touchGesture.addTarget(self, action: #selector(onTap(tap:)))
        view.addGestureRecognizer(touchGesture)
        
        optionalDimmingView = view
        
        return view
    }
    
    init(presentedViewController: UIViewController,
         presenting presentingViewController: UIViewController?,
         modalHeight: ModalHeight,
         addPanGestureToMaximize: Bool = false,
         dimmingViewType: DimmingViewType = .transparent) {
        self.modalHeight = modalHeight
        self.dimmingViewType = dimmingViewType
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        if addPanGestureToMaximize {
            panGestureRecognizer.addTarget(self, action: #selector(onPan(pan:)))
            presentedViewController.view.addGestureRecognizer(panGestureRecognizer)
        }
    }
    
    @objc func onTap(tap: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true)
    }
    
    @objc func onPan(pan: UIPanGestureRecognizer) {
        guard let presentedView = presentedView, let containerView = containerView else { return }
        let endPoint = pan.translation(in: pan.view?.superview)
        
        switch pan.state {
        case .began:
            presentedView.frame.size.height = containerView.frame.height
        case .changed:
            let velocity = pan.velocity(in: pan.view?.superview)
            print(velocity.y)
            switch state {
            case .normal:
                presentedView.frame.origin.y = endPoint.y + containerView.frame.height / 2
            case .adjustedOnce:
                presentedView.frame.origin.y = endPoint.y
            }
            direction = velocity.y
            
        case .ended:
            if direction < 0 {
                changeScale(to: .adjustedOnce)
            } else {
                if state == .adjustedOnce {
                    changeScale(to: .normal)
                } else {
                    presentedViewController.dismiss(animated: true, completion: nil)
                }
            }
            
            print("finished transition")
            
        default:
            break
        }
    }
    
    func changeScale(to state: ModalScaleState) {
        guard let presentedView = presentedView, let containerView = self.containerView else { return }
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: { () -> Void in
            presentedView.frame = containerView.frame
            let containerFrame = containerView.frame
            let halfFrame = CGRect(origin: CGPoint(x: 0, y: self.modalHeight.getOriginY(from: containerFrame.height)),
                                   size: CGSize(width: containerFrame.width, height: self.modalHeight.getHeight(from: containerFrame.height)))
            let frame = state == .adjustedOnce ? containerView.frame : halfFrame
            
            presentedView.frame = frame
            
            if let navController = self.presentedViewController as? UINavigationController {
                self.isMaximized = true
                
                navController.setNeedsStatusBarAppearanceUpdate()
                
                // Force the navigation bar to update its size
                navController.isNavigationBarHidden = true
                navController.isNavigationBarHidden = false
            }
        }, completion: { (_) in
            self.state = state
        })
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = self.containerView else {
            return CGRect.zero
        }
        return CGRect(x: 0,
                      y:  modalHeight.getOriginY(from: containerView.bounds.height),
                      width: containerView.bounds.width,
                      height: modalHeight.getHeight(from: containerView.bounds.height))
    }
    
    override func presentationTransitionWillBegin() {
        let dimmedView = dimmingView
        
        if let containerView = self.containerView, let coordinator = presentingViewController.transitionCoordinator {
            
            dimmedView.alpha = 0
            containerView.addSubview(dimmedView)
            dimmedView.addSubview(presentedViewController.view)
            
            coordinator.animate(alongsideTransition: { (_) -> Void in
                dimmedView.alpha = 1
                self.presentingViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }, completion: nil)
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentingViewController.transitionCoordinator {
            
            coordinator.animate(alongsideTransition: { (_) -> Void in
                self.dimmingView.alpha = 0
                self.presentingViewController.view.transform = CGAffineTransform.identity
            }, completion: { (_) -> Void in
                print("done dismiss animation")
            })
            
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        print("dismissal did end: \(completed)")
        
        if completed {
            dimmingView.removeFromSuperview()
            optionalDimmingView = nil
            
            isMaximized = false
        }
    }
}

protocol HalfModalPresentable { }

extension HalfModalPresentable where Self: UIViewController {
    func maximizeToFullScreen() {
        if let presetation = navigationController?.presentationController as? HalfModalPresentationController {
            presetation.changeScale(to: .adjustedOnce)
        }
    }
}

extension HalfModalPresentable where Self: UINavigationController {
    func isHalfModalMaximized() -> Bool {
        if let presentationController = presentationController as? HalfModalPresentationController {
            return presentationController.isMaximized
        }
        
        return false
    }
}
