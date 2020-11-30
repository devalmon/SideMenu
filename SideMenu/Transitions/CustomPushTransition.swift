//
//  CustomPushTransition.swift
//  SideMenu
//
//  Created by Alexey Baryshnikov on 27.11.2020.
//

import UIKit

//class CustomPushTransition: NSObject, UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        0.3
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//
//        guard let fromVC = transitionContext.viewController(forKey: .from),
//              let toVC = transitionContext.viewController(forKey: .to) else { return }
//
//        let finalFrame = transitionContext.finalFrame(for: toVC)
//        let containerView = transitionContext.containerView
//        let bounds = UIScreen.main.bounds
//        containerView.addSubview(toVC.view)
//
//        toVC.view.alpha = 0.0
//        toVC.view.frame = finalFrame.offsetBy(dx: 0, dy: bounds.height)
//
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//
//            fromVC.view.alpha = 0.0
//            toVC.view.alpha = 1.0
//            toVC.view.frame = finalFrame
//
//        }) { (isFinished) in
//            fromVC.view.alpha = 1.0
//            transitionContext.completeTransition(isFinished)
//        }
//
//    }
//}

private let animationDuration: TimeInterval = 1

class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to) else { return }
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toVC.view)
        
        fromVC.view.alpha = 0.0
        
        toVC.view.frame = finalFrame.offsetBy(dx: -bounds.width, dy: 0)
        toVC.view.alpha = 0.0
        fromVC.view.alpha = 1.0
        fromVC.view.frame = bounds
        
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//            toVC.view.frame = finalFrame
//            toVC.view.alpha = 1.0
//            fromVC.view.alpha = 0.0
//            
//        }) { (isFinished) in
//            fromVC.view.alpha = 1.0
//            transitionContext.completeTransition(isFinished)
//        }
        
        
                UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: .allowUserInteraction) {
        
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: animationDuration / 2) {
                        fromVC.view.alpha = 0.0
                    }
        
                    UIView.addKeyframe(withRelativeStartTime: animationDuration / 2, relativeDuration: animationDuration / 2) {
                        fromVC.view.alpha = 1.0
                    }
        
                } completion: { (isFinished) in
                    transitionContext.completeTransition(isFinished)
                }
        
        
    }
    
    
}
