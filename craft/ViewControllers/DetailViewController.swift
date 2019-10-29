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
    
    @IBOutlet weak var imageGalery: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    //MARK: Initial
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.\
        pageControl.numberOfPages = 10
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trungnguyen", for: indexPath)
        return cell
    }
}

extension DetailViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
}
extension DetailViewController : UIScrollViewDelegate{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(imageGalery.visibleCells.startIndex)
        print(imageGalery.visibleCells.startIndex)
        print("------")
        for cell in imageGalery.visibleCells {
            if let indexPath = imageGalery.indexPath(for: cell) {
                pageControl.currentPage = indexPath.row ?? 0
                break
            }
        }
    }
}
