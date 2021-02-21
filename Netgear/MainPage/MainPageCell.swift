//
//  MainPageCell.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/19/21.
//

import UIKit

class MainPageCell: UICollectionViewCell {
    
    var netImage: [NetImage]? {
        didSet {
            guard let images = self.netImage
            else {
                return
                
            }
            groupImageVC.groupImage = images
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var groupImageVC = GroupImageVC() 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(containerView)
        containerView.addSubview(groupImageVC.view)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
        ])
        
        groupImageVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            groupImageVC.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            groupImageVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            groupImageVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            groupImageVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(items: [ManifestImageInfo]){
        groupImageVC.pageControl.numberOfPages = items.count
        var netImages = [NetImage]()
        for item in items {
            netImages.append(NetImage(name: item.name, url: item.url, type: "", width: 0, height: 0))
        }
        self.netImage = netImages
        
    }
    
}
