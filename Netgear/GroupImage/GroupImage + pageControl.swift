//
//  GroupImage + pageControl.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/20/21.
//

import UIKit


// MARK: - setup pageControl in UI
extension GroupImageVC {
    func setupBottomControls() {
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}
