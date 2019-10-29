//
//  RecommendationViewController.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/18/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import  UIKit

class RecommendationViewController: BaseViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let anima = PopAnimation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup
        navigationController?.setNavigationBarHidden(true, animated: true)
//        navigationController?.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension RecommendationViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trungnguyen1", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        super.selectedView = collectionView.cellForItem(at: indexPath)
        super.selectedView.isHidden = true
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "CategoryID")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RecommendationViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 276, height: collectionView.frame.height - collectionView.contentInset.top - collectionView.contentInset.bottom)
    }
}
