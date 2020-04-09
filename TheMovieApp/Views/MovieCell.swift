//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell, ConfigureCell {

    var item: Movie! {
        didSet {
            lable.text = item.title
        }
    }

    static var reuseIdentifer: String = "MovieCell"

    let lable = UILabel()
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lable.textColor = .yellow
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        
        imageView.backgroundColor = .red

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
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        stackView.setCustomSpacing(10, after: lable)
    
    }
    
    func configure(with movie: Movie) {
   
            lable.text = movie.title
        
     }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
