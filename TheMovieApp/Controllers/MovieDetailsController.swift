//
//  MovieDetailsController.swift
//  TheMovieApp
//
//  Created by Richard Price on 13/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MovieDetailsController: BaseListController, UICollectionViewDelegateFlowLayout {

    fileprivate let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
        super.init()
        
        collectionView.backgroundColor = .purple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
