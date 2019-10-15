//
//  TitleView.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/15/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import UIKit

@IBDesignable
public class TitleView: UIView {
    
    @IBInspectable var titleColor : UIColor? {
        didSet{
            self.label.textColor = titleColor
        }
    }
    // Connect the custom button to the custom class
    @IBOutlet var view: UIView!
    //subviews
    @IBOutlet weak var navigate: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cart: UIButton!
    override init(frame: CGRect) {
     super.init(frame: frame)
     setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        
        //set up for navigate item
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: navigate.frame.width, height: navigate.frame.height), cornerRadius: navigate.frame.height/2)
        let firstShape = CAShapeLayer()
        firstShape.fillColor = UIColor.white.cgColor
        firstShape.path = rectanglePath.cgPath
//        navigate.layer.addSublayer(firstShape)
    }
    
    func loadViewFromNib() -> UIView! {
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
      let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
      
      return view
    }
}
