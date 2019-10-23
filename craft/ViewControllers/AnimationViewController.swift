//
//  AnimationViewController.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/22/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

class AnimationViewController : NSObject {
    private let animationDuration : Double
    private let animationType : AnimationType
    enum AnimationType {
        case present
        case dismiss
    }
    
    init(animationDuration : Double, type : AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = type
    }
}
extension AnimationViewController : UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from)
            else {
                transitionContext.completeTransition(false)
                return
        }
        
        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toViewController.view)
            presentAnimatedTransition(with: transitionContext, viewToAnimate: toViewController.view)
        case .dismiss:
            print("impl")
            
        }
        
    }
    
    func presentAnimatedTransition (with transitionContext : UIViewControllerContextTransitioning, viewToAnimate : UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform  = CGAffineTransform(scaleX: 0, y: 0)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (isSucces) in
            transitionContext.completeTransition(true)
        }
    }
    
    
}

