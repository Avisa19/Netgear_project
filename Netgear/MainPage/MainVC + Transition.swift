//
//  MainVC + Transition.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/20/21.
//

import UIKit

// MARK: - Adjust the landscape and portraite
extension MainViewController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()

            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }

        }) { (_) in

        }
    }
  
}
