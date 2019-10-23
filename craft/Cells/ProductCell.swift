//
//  ProductCell.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/22/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var containerView : UIView!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var productName : UILabel!
    @IBOutlet weak var productColor : UILabel!
    @IBOutlet weak var productPrice : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    var product : Product? {
        didSet {
            if  let product = product {
                imageView.image = product.image
                productName.text = product.name
                productColor.text = product.color
                productPrice.text = String(describing: product.price)
            }
        }
    }
}
