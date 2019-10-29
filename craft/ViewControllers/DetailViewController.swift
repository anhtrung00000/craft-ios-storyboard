//
//  DetailViewController.swift
//  craft
//
//  Created by Nguyen Quy Trung on 10/17/19.
//  Copyright © 2019 Nguyen Quy Trung. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    //MARK: Properties
    var photos : [UIImage]!
    //MARK: Outlets
    @IBOutlet weak var imageGalery: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    //MARK: Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        photos = Product.allProduct().map({
            $0.image
        })
        // Do any additional setup after loading the view.\
        pageControl.numberOfPages = photos.count
        pageControl.currentPage = 0;
        pageControl.currentPageIndicatorTintColor = UIColor.FlatColor.Orange.AppPrioty.withAlphaComponent(0.5)
    }
    //MARK: Handlers
    @IBAction func back(_ sender : Any){
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trungnguyen", for: indexPath) as? PhotoCell
        let image = photos[indexPath.row]
        guard let cel = cell else {
            cell = PhotoCell()
            cell?.image = image
            return cell!
        }
        cel.image = image
        return cel
    }
}

extension DetailViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
}
extension DetailViewController : UIScrollViewDelegate{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print("------st \(scrollView.contentOffset)")
//        print(imageGalery.visibleCells.startIndex)
//        print(imageGalery.visibleCells.endIndex)
//
//        for cell in imageGalery.visibleCells {
//            if let indexPath = imageGalery.indexPath(for: cell) {
//                print(indexPath.row)
//                print("------")
//                pageControl.currentPage = indexPath.row ?? 0
//                break
//            }
//        }
        print ("3scrollViewDidEndDragging")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print ("14scrollViewDidScroll")
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            print ("scrollViewWillBeginDragging")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print ("5scrollViewDidEndDecelerating")
        print("------st \(scrollView.contentOffset)")
        let xOffset = scrollView.contentOffset.x
        let contentSize = scrollView.contentSize.width
        let index = (xOffset * CGFloat(self.photos!.count)) / contentSize
        pageControl.currentPage = Int(index) ?? 0
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print ("2scrollViewWillEndDragging")
    }
}
