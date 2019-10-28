//
//  RecommendationViewController.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/18/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import Foundation
import  UIKit

class RecommendationViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let anima = AnimationViewController(animationDuration: 1, type: .present)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.delegate = self
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
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "CategoryID")
        
//        let fra = attributes?.frame ?? CGRect(x: 0,y: 0,width: 0,height: 0)
//        anima.startPoint = CGPoint(x: fra.minX, y: fra.minY)
        navigationController?.pushViewController(vc, animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let position = touch.location(in: view)
        print(position)
    }
}

extension RecommendationViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 276, height: collectionView.frame.height - collectionView.contentInset.top - collectionView.contentInset.bottom)
    }
}

extension RecommendationViewController : UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        anima.animationType = operation == .push ? .present : .dismiss
        return anima
    }
}
