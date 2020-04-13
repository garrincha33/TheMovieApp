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
        case popularSection
        case trendingSection
    }
    
    //MARK:- COMP LAYOUT TOP SECTION---
    static func topSection() -> NSCollectionLayoutSection {
        let items = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        items.contentInsets.bottom = 16
        items.contentInsets.trailing = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.60), heightDimension: .absolute(350)), subitems: [items])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 16
        section.contentInsets.bottom = 32
        section.contentInsets.top = 16


        //MARK:-HEADER SETUP----------------TOP
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        
        return section
    }
    
    //MARK:- COMP LAYOUT BOTTOM SECTION---
    static func bottomSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 32)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.50), heightDimension: .absolute(400)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 16
        section.contentInsets.bottom = 32
        section.contentInsets.top = 16
 
        //MARK:-HEADER SETUP----------------BOTTOM
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        //----------------------------------
        return section
        
    }

    //MARK:- SETUP HEADER FUNCTION
    func setupHeader() {
        diffableDataSource.supplementaryViewProvider = .some({ (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
                return nil
            }
            switch indexPath.section {
            case 0:
                sectionHeader.title.text = "Out Now" //step 5 also adjust here for display text
                //sectionHeader.genre.text = "All Genres"
            case 1:
                sectionHeader.title.text = "Top Rated"
                //sectionHeader.genre.text = "All Genres"
            case 2:
                sectionHeader.title.text = "Trending "
                //sectionHeader.genre.text = "All Genres"
            case 3:
                sectionHeader.title.text = "Popular"
                //sectionHeader.genre.text = "All Genres"
            default:
                sectionHeader.title.text = "Default"
            }
            return sectionHeader
        })
    }

    
}

