//
//  ViewController.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/15/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Properties
    let transition = PopAnimation()
    var selectedView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.FlatColor.Orange.AppPrioty
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.delegate = self
        if  let collectionViewLayout = collectionView?.collectionViewLayout as? ProductLayout {
            collectionViewLayout.delegate = self
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension CategoryController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        let pro = Product.allProduct()[indexPath.row]
        cell.product = pro
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Product.allProduct().count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedView = collectionView.cellForItem(at: indexPath)
        selectedView.isHidden = true
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "DetailID")
        navigationController?.show(vc, sender: nil)
    }
}
extension CategoryController : ProductLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Product.allProduct()[indexPath.item].image.size.height > 400 ? 400 : Product.allProduct()[indexPath.item].image.size.height
    }
    
    
}

extension CategoryController : UINavigationControllerDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationViewController(animationDuration: 3.5, type: .present)
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = selectedView!.superview!.convert(selectedView.frame, to: self.view)
        transition.presenting = operation == .push
        transition.dismissCompletionAnimation = { (isSucces) in
            self.selectedView.isHidden = false
        }
        return transition
    }
}

