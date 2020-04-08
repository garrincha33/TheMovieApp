//
//  TopRatedMovieCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 08/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class TopRatedMovieCell: UICollectionViewCell, ConfigureCell {
    
    static var reuseIdentifer: String = "TopRatedMovieCell"
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    

    
    func configure(with movie: [Movie]) {
        //TODO:-
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented dont care about storyboards")
    }
    
}
