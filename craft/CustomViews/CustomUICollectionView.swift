//
//  CustomUICollectionView.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/18/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import UIKit

protocol CustomCollectionViewDelegate {
    func getDataSource<T>() -> [T]
    func getCell<V>() -> V
}

class CustomUICollectionView : UICollectionView{
    
}

extension CustomUICollectionView : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
 
