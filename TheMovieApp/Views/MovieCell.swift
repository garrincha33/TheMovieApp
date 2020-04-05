//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell, ConfigureCell {

    static var reuseIdentifer: String = "MovieCell"

    let lable = UILabel()
    //step 3 add image view for testing
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lable.textColor = .yellow
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        
        imageView.backgroundColor = .red
        
        
        //step 3 add image view for testing
        let stackView = UIStackView(arrangedSubviews: [imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        stackView.setCustomSpacing(10, after: lable)
    
    }
    
    func configure(with movie: [Movies]) {
        //step 4 loop through items. using model as a test
        for movies in movie {
            
            lable.text = movies.title
        }
     }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
