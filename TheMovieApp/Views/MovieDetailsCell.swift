//
//  MovieDetailsCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 13/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsCell: UICollectionViewCell, ConfigureCell {
    
    static var reuseIdentifer: String = "MovieDetailsCell"
    
    let movieTitleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.text = "Movie Title"
        lable.font = UIFont.boldSystemFont(ofSize: 20)
        lable.numberOfLines = 0
        return lable
    }()
    
    let movieDetails: UILabel = {
        let tv = UILabel()
        tv.textColor = .white
        tv.text = "test"
        tv.font = UIFont.boldSystemFont(ofSize: 14)
        tv.numberOfLines = 0
        return tv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 350).isActive = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let titleStackView = UIStackView(arrangedSubviews: [movieTitleLable])
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.axis = .horizontal
        titleStackView.distribution = .equalSpacing
        contentView.addSubview(titleStackView)
        
        let movieDetailsStackView = UIStackView(arrangedSubviews: [movieDetails])
        movieDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        movieDetailsStackView.axis = .vertical
        movieDetailsStackView.distribution = .equalSpacing
        contentView.addSubview(movieDetailsStackView)
        
        let overallStackView = UIStackView(arrangedSubviews: [titleStackView, movieDetailsStackView, UIView(), UIView()])
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        overallStackView.axis = .vertical

        overallStackView.distribution = .equalSpacing
        contentView.addSubview(overallStackView)

        
        NSLayoutConstraint.activate([
            overallStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overallStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overallStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            overallStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -135)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with movie: Movie) {
        movieTitleLable.text = movie.title
        movieDetails.text = movie.overview
        let posterPath = movie.poster_path
        guard let url = URL(string: "\(BASEIMAGEURL)\(posterPath ?? "")") else {return}
        imageView.sd_setImage(with: url, completed: nil)
    }

}
