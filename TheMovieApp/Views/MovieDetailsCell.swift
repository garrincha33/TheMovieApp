//
//  MovieDetailsCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 13/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

//STEP 2 create a movie details cell, this will hold all of our info
class MovieDetailsCell: UICollectionViewCell, ConfigureCell {
    
    static var reuseIdentifer: String = "MovieDetailsCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with movie: Movie) {
        ////TODO
    }
    

    
}
