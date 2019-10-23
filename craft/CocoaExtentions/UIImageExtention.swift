//
//  UIImageExtention.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/18/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class UIImageExtention: UIImageView {
    @IBInspectable var alwaysTemplate: Bool = false {
        didSet {
            if alwaysTemplate {
                self.image = self.image?.withRenderingMode(.alwaysTemplate)
            } else {
                self.image = self.image?.withRenderingMode(.alwaysOriginal)
            }

        }
    }
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
}
