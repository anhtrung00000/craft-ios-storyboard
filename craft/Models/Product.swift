//
//  Product.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/22/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit
struct Product {
    var image : UIImage
    var name : String
    var color : String
    var price : Decimal
    
    static func allProduct() -> [Product] {
        var products : [Product]  = []
        for ite in 1...11 {
            let pro = Product(image: UIImage(named: "sofa" + String(describing: ite)) ?? UIImage(), name: "Vamila Sofa", color: "Black", price: 123.545)
            products.append(pro)
        }
        return products
    }
}
