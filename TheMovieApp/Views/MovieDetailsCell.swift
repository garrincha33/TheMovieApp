//
//  MovieDetailsCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 13/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MovieDetailsCell: UICollectionViewCell, ConfigureCell {
    
    static var reuseIdentifer: String = "MovieDetailsCell"
    
    let movieTitleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.text = "Movie Title"
        lable.font = UIFont.boldSystemFont(ofSize: 20)
        return lable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(movieTitleLable)
        movieTitleLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieTitleLable.topAnchor.constraint(equalTo: topAnchor),
            movieTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieTitleLable.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieTitleLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 250)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with movie: Movie) {
        movieTitleLable.text = movie.title
    }

}
