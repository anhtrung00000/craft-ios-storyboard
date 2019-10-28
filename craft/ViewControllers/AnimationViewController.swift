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
    var animationDuration : Double
    var animationType : AnimationType
    var startPoint : CGPoint?
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
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
        }
        
    }
    
    func presentAnimatedTransition (with transitionContext : UIViewControllerContextTransitioning, viewToAnimate : UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform  = CGAffineTransform(scaleX: 0, y: 0)
        viewToAnimate.setAnchorPoint(self.startPoint ?? CGPoint(x: 0.5, y: 0.5))
        
        let duration = transitionDuration(using: transitionContext)
        
        //caculate what distance need to transform to complte the animation
        
        let yDistance = (0.5 - (self.startPoint?.y ?? 0)) * viewToAnimate.frame.height
        
        let xDistance = (0.5 - (self.startPoint?.x ?? 0)) * viewToAnimate.frame.width
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.80, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            viewToAnimate.transform = CGAffineTransform(translationX: xDistance, y: yDistance)
        }) { (isSucces) in
            transitionContext.completeTransition(true)
        }
    }
    func dismissAnimation(with transitionContext : UIViewControllerContextTransitioning, viewToAnimate : UIView) {
        let duration = transitionDuration(using: transitionContext)
        let scaleDown = CGAffineTransform(scaleX: 0.3, y: 0.3)
        let moveOut = CGAffineTransform(translationX: -viewToAnimate.frame.width, y: 0)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7) {
                viewToAnimate.transform =  scaleDown
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8571428571, relativeDuration: 1) {
                viewToAnimate.transform = scaleDown.concatenating(moveOut)
                viewToAnimate.alpha = 0
            }
        }) { (isSucces) in
            transitionContext.completeTransition(true)
            viewToAnimate.removeFromSuperview()
        }
    }
}
extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = point
    }
}

