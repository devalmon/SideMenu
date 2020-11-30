//
//  CustomPopTransition.swift
//  SideMenu
//
//  Created by Alexey Baryshnikov on 27.11.2020.
//

import UIKit

class CustomPopTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from),
              let toViewController = transitionContext.viewController(forKey: .to) else { return }
        
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        let containerView = transitionContext.containerView
        
        containerView.addSubview(fromViewController.view)
        
//        let bounds = UIScreen.main.bounds
        
        containerView.addSubview(toViewController.view)
        containerView.sendSubviewToBack(toViewController.view)
        
//        guard let snapShotView = fromViewController.view.snapshotView(afterScreenUpdates: true) { return }
//        snapShotView?.frame = fromViewController.view.frame else { return  }
        
//        containerView.addSubview(snapShotView)
        fromViewController.view.removeFromSuperview()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut) {
            
            toViewController.view.alpha = 1.0
            toViewController.view.frame = finalFrame
            
//            fromViewController.view.alpha = 0.0
            
        } completion: { (isFinished) in
            fromViewController.view.alpha = 1.0
            transitionContext.completeTransition(isFinished)
        }
    }
}
