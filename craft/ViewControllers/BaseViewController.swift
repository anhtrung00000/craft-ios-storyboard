//
//  BaseViewController.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/28/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    var selectedView : UIView!
    let animation = PopAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if navigationController?.delegate == nil {
            navigationController?.delegate = self
        }
    }
}
extension BaseViewController : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var toSelectView = (toVC as! BaseViewController).selectedView
        var fromSelectView = (fromVC as! BaseViewController).selectedView

        let selectView = operation == .push ? fromSelectView : toSelectView
        
        animation.originFrame = (selectedView ?? selectView!).superview!.convert((selectedView ?? selectView!).frame, to: self.view)
        animation.presenting = operation == .push
        animation.dismissCompletionAnimation = { (isSucces) in
            selectView!.isHidden = false
        }
        return animation
    }
}
