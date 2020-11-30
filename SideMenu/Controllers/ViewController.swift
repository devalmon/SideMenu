//
//  ViewController.swift
//  SideMenu
//
//  Created by Alexey Baryshnikov on 26.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let dest = segue.destination
//
//        dest.modalPresentationStyle = .custom
//        dest.transitioningDelegate = self
//
//    }
}

extension ViewController: MenuTextDelegate {
    func update(_ text: String) {
            self.number.text = text
    }
}

//extension ViewController: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        print(presenting, source, presented)
//        return CustomPushAnimation()
//    }
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        print("dismissed")
//        return CustomPushAnimation()
//    }
//}

