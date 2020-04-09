//
//  CompositionalSections.swift
//  TheMovieApp
//
//  Created by Richard Price on 08/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

extension MainController {
    enum Section {
        case topSection
        case bottomSection
    }
    
    //MARK:- COMP LAYOUT TOP SECTION---
    static func topSection() -> NSCollectionLayoutSection {
        let items = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        items.contentInsets.bottom = 16
        items.contentInsets.trailing = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(300)), subitems: [items])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 16
        
        return section
    }
    
    //MARK:- COMP LAYOUT BOTTOM SECTION---
    static func bottomSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 8, trailing: 32)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.70), heightDimension: .absolute(400)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 16
        //step 3 add to comp layout
        //MARK:-HEADER SETUP----------------
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        //----------------------------------
        return section
        
    }
    
    //step 2 create a function to setup the header
    //MARK:- SETUP HEADER FUNCTION
    func setupHeader() {
        diffableDataSource.supplementaryViewProvider = .some({ (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
                return nil
            }
            switch indexPath.section {
            case 0:
                sectionHeader.title.text = "Test"
            case 1:
                sectionHeader.title.text = "Top Rated Movies"
            default:
                sectionHeader.title.text = "Default"
            }
            return sectionHeader
        })
    }
    
}

