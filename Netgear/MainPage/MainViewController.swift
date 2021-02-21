//
//  ViewController.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/19/21.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    var manifests = [[String]]()
    var manifestInfo = [[ManifestImageInfo]]()
    let GROUP_ID_CELL = "GroupIdCell"
    var currentPageIndex = 0
    
    let dispatchGroup = DispatchGroup()
    let dispatchQueue = DispatchQueue(label: "queue")
    let dispatchSemaphore = DispatchSemaphore(value: 0)
    
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = self.manifestInfo.count
        pc.currentPageIndicatorTintColor = .clear
        pc.pageIndicatorTintColor = .clear
        return pc
    }()
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchDatafromAPI()
        self.collectionView.isScrollEnabled = false
        
        self.collectionView.backgroundColor = .white
        self.collectionView.register(MainPageCell.self, forCellWithReuseIdentifier: GROUP_ID_CELL)
        collectionView?.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        setupBottomControls()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("change")
    }
    
    
    
}

