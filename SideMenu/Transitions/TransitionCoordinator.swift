//
//  TransitionCoordinator.swift
//  SideMenu
//
//  Created by Alexey Baryshnikov on 30.11.2020.
//

import UIKit

class TransitionCoordinator: NSObject, UINavigationControllerDelegate {
    var interactionController: UIPercentDrivenInteractiveTransition?

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return TransitionAnimator(presenting: true)
        case .pop:
            return TransitionAnimator(presenting: false)
        default:
            return nil
        }
    }

    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}
