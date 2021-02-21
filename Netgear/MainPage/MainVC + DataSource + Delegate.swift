//
//  MainVC + DataSource + Delegate.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/20/21.
//

import UIKit


// MARK: - Delegate and Datasource
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.manifestInfo.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GROUP_ID_CELL, for: indexPath) as! MainPageCell
        cell.loadData(items: manifestInfo[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: self.view.frame.height)
    }
    
}

