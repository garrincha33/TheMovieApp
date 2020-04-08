//
//  CompositionalSections.swift
//  TheMovieApp
//
//  Created by Richard Price on 08/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//


// step 1 create a new group and controller create an enum of sections
import UIKit

extension MainController {
    enum Section {
        case topSection
        case bottomSection
    }

// step 2 create top section
static func topSection() -> NSCollectionLayoutSection {
    let items = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    items.contentInsets.bottom = 16
    items.contentInsets.trailing = 16
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(300)), subitems: [items])
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    section.contentInsets.leading = 8
    return section
}

    // step 3 create bottom section
static func bottomSection() -> NSCollectionLayoutSection {
    let items = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalHeight(1), heightDimension: .fractionalHeight(1/2)))
    items.contentInsets = .init(top: 0, leading: 0, bottom: 8, trailing: 32)
    let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.70), heightDimension: .absolute(300)), subitems: [items])
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    section.contentInsets.leading = 16
    return section
    }

}

