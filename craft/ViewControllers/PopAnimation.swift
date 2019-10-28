//
//  PopAnimation.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/24/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit
class PopAnimation : NSObject {
    let duration : TimeInterval = 0.5
    var presenting = true
    var originFrame = CGRect.zero
    var presentCompletionAnimation : ((Bool) -> Void)?
    var dismissCompletionAnimation : ((Bool) -> Void)?
}

extension PopAnimation : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //1. Get container view
        let container = transitionContext.containerView
        
        //2. Get herbView
        
        guard let fromView = transitionContext.viewController(forKey: .from),
            let toView = transitionContext.viewController(forKey: .to),
            let herbView = presenting ? toView.view : fromView.view/*.viewWithTag(100)*/
            else {
                return
        }
        herbView.frame = presenting ? UIScreen.main.bounds : herbView.frame
        
        //3. get x, y  scale factor
        let initialFrame = presenting ? originFrame : UIScreen.main.bounds
        let finalFrame = presenting ? UIScreen.main.bounds : originFrame
        
        let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        let yScaleFactor = presenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        if presenting {
            herbView.transform = scaleTransform
            herbView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            herbView.clipsToBounds = true
            
            //add subviews to container
//            container.addSubview(transitionContext.view(forKey: .to)!)
        }
        container.addSubview(transitionContext.view(forKey: .to)!)
        container.bringSubviewToFront(herbView)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            if self.presenting {
                herbView.transform = CGAffineTransform(scaleX: 1, y: 1)
            } else {
                herbView.frame = finalFrame
                herbView.alpha = 0.5
            }
            herbView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }) { (isSucces) in
            transitionContext.completeTransition(true)
            self.presenting ? self.presentCompletionAnimation?(true) : self.dismissCompletionAnimation?(true)
        }
    }
}
