//
//  MainVC + FetchData.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/20/21.
//

import UIKit

// MARK: - Fetch data from API

extension MainViewController {
    
     func fetchDatafromAPI() {
        NetWorkManager.shared.getManifestData(name: "manifest") { [weak self] (manifests, err) in
            if let err = err {
                print(err)
            }
            
            if let mains = manifests {
                self?.manifests = mains
                var manifestInfo = [[ManifestImageInfo]]()
                self?.dispatchQueue.async {
                    for mani in mains {
                        var manifestImageInfo = [ManifestImageInfo]()
                        for m in mani {
                            self?.dispatchGroup.enter()
                            NetWorkManager.shared.getImageDetail(name: m) { (netImage, err) in
                                if let err = err {
                                    print(err)
                                }
                                
                                if let image = netImage {
                                    manifestImageInfo.append(ManifestImageInfo(name: image.name, url: image.url))
                                }
                                self?.dispatchSemaphore.signal()
                                self?.dispatchGroup.leave()
                            }
                            self?.dispatchSemaphore.wait()
                        }
                        manifestInfo.append(manifestImageInfo)
                    }
                }
                
                self?.dispatchGroup.notify(queue: self!.dispatchQueue, execute: {
                    DispatchQueue.main.async {
                        self?.manifestInfo = manifestInfo
                        self?.collectionView.reloadData()
                    }
                })
                
            }
        }
    }
   
}

