//
//  ProductLayout.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/22/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

protocol ProductLayoutDelegate : AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath : NSIndexPath) -> CGFloat
}

class ProductLayout: UICollectionViewLayout {
    //1
    weak var delegate : ProductLayoutDelegate?
    
    //2
    private let numberOfColumns : Int = 2
    private let cellPadding : CGFloat = 6
    
    //3
    private var cache : [UICollectionViewLayoutAttributes] = []
    
    //4
    private var contentHeight : CGFloat = 0
    
    private var contentWidth : CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - insets.left - insets.right
    }
    //5
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        //1
        guard cache.isEmpty,
        let collectionView = collectionView
            else {
            return
        }
        //2
        let collumnWith = contentWidth / CGFloat(numberOfColumns)
        var xOffset : [CGFloat] = []
        for column  in 0..<numberOfColumns {
            xOffset.append(collumnWith * CGFloat(column))
        }
        var column  = 0
        var yOffset : [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        //3
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = NSIndexPath(item: item, section: 0)
            
            //4
            let photoHeight = delegate?.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath) ?? 180
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: collumnWith, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            //5
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            //6
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column]  = yOffset[column] + height
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visiableCollectionViewLayoutAttributes : [UICollectionViewLayoutAttributes] = []
        //loop through the cache and find items in rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visiableCollectionViewLayoutAttributes.append(attributes)
            }
        }
        return visiableCollectionViewLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
