//
//  UIButtonExtention.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/16/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class CustomUIButton : UIButton {
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var hasShadow: Bool = false {
        didSet {
            if hasShadow {
                layer.shadowPath =
                    UIBezierPath(roundedRect: self.bounds,
                cornerRadius: self.layer.cornerRadius).cgPath
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.5
                self.layer.shadowOffset = CGSize(width: 10, height: 10)
                self.layer.shadowRadius = 1
                self.layer.masksToBounds = false
            } else {
                layer.shadowPath = nil
            }

        }
    }
    
    @IBInspectable var shadowColor: UIColor?{
        didSet {
            layer.shadowColor = shadowColor?.cgColor
            layer.shadowPath =
                UIBezierPath(roundedRect: self.bounds,
            cornerRadius: self.layer.cornerRadius).cgPath
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0{
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowOffsetW: CGFloat = 0.0{
        didSet {
            layer.shadowOffset = CGSize(width: shadowOffsetW, height: shadowOffsetH)
        }
    }
    
    @IBInspectable var shadowOffsetH: CGFloat = 0.0{
        didSet {
            layer.shadowOffset = CGSize(width: shadowOffsetW, height: shadowOffsetH)
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0.0{
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
}
