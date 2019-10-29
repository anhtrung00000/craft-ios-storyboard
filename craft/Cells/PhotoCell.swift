//
//  PhotoCell.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/29/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell : UICollectionViewCell {
    //MARK: Outlets
    
    @IBOutlet weak var imageView : UIImageView!
    
    //MARK: Properties
    
    var image : UIImage? {
        didSet {
            imageView.image = image
        }
    }
}
