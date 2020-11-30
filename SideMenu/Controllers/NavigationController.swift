//
//  NavigationController.swift
//  SideMenu
//
//  Created by Alexey Baryshnikov on 27.11.2020.
//

import UIKit

class NavigationController: UINavigationController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            toVC.modalPresentationStyle = .fullScreen
            fromVC.transitioningDelegate = self
            return CustomPushAnimation()
        }
        
    }
    
    
    

}
extension NavigationController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPushAnimation()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPushAnimation()
    }
}
