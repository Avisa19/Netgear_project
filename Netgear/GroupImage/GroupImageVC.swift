//
//  GroupImageVC.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/19/21.
//

import UIKit


class GroupImageVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var groupImage : [NetImage]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .systemPink
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
      
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(ImageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
        collectionView.showsHorizontalScrollIndicator = false
        setupBottomControls()
        
    }
    
    init(collectionViewLayout layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) {
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        super.init(collectionViewLayout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

