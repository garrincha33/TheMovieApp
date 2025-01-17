//
//  StretchyHeaderLayout.swift
//  TheMovieApp
//
//  Created by Richard Price on 15/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    //step 1 create header flow class
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0 {

                guard let collectionView = collectionView else {return}
                
                let contentOffsetY = collectionView.contentOffset.y
                if contentOffsetY > 0 {
                    return
                }
                let width = collectionView.frame.width
                let height = attributes.frame.height - contentOffsetY
    
                
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)

            }
            
        })
        
        return layoutAttributes
        
    }
    
    //step 2
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
    
}
