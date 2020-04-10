//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell, ConfigureCell {

//    var item: Movie! {
//        didSet {
//            lable.text = item.title
//        }
//    }

    static var reuseIdentifer: String = "MovieCell"

    let lable = UILabel()
    let imageView = UIImageView()
    //step 5 create poster image
    let posterImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lable.textColor = .yellow
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        
        imageView.backgroundColor = .red
        //step 5 add into stack
        let stackView = UIStackView(arrangedSubviews: [posterImage])
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
    //step 6 add to configure cell
    func configure(with movie: Movie) {
        lable.text = movie.title
        let posterPath = movie.poster_path
        guard let url = URL(string: "\(BASEIMAGEURL)\(posterPath ?? "")") else {return}
        posterImage.sd_setImage(with: url, completed: nil)
     }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
