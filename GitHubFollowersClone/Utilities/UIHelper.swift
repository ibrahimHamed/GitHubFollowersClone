//
//  UIHelper.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 03/04/2022.
//

import UIKit

struct UIHelper {
    static func createThreeColumnsFlowLayout(in view : UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding : CGFloat = 12
        let minItemsSpacing : CGFloat = 10
        let netWidth = width - (padding * 2) - (minItemsSpacing * 2)
        let itemWidth = netWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
