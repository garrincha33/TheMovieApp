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
    
    let lable = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .yellow
        
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
    
    
    
    
    
    func configure(with movie: Movie) {
        //TODO:-
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}






