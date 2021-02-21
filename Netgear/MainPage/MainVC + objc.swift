//
//  MainVC + objc.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/20/21.
//

import UIKit

extension MainViewController {
    
    @objc func handleNext() {
        currentPageIndex += 1
        if currentPageIndex < self.manifestInfo.count {
            let indexPath = IndexPath(item: currentPageIndex, section: 0)
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else {
            currentPageIndex -= 1
        }
        
    }
    
    @objc func handlePrev() {
        currentPageIndex -= 1
        if currentPageIndex < self.manifestInfo.count && currentPageIndex >= 0 {
            let indexPath = IndexPath(item: currentPageIndex, section: 0)
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } else {
            currentPageIndex += 1
        }
    }
}
