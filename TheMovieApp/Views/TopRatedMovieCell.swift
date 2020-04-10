//
//  TopRatedMovieCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 08/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//
import UIKit
//step 1 install sdwebimage pod
import SDWebImage

class TopRatedMovieCell: UICollectionViewCell, ConfigureCell {
    
    static var reuseIdentifer: String = "TopRatedMovieCell"
    
    let lable = UILabel()
    //step 2 create poster image view
    let posterImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //step 3 add poster image into stack
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
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        stackView.setCustomSpacing(10, after: lable)
        
    }
    
    
    
    
    //step 4 configure cell with poster image and turn of NSTRANSAPP security
    func configure(with movie: Movie) {
        let posterPath = movie.poster_path
        guard let url = URL(string: "\(BASEIMAGEURL)\(posterPath ?? "")") else {return}
        posterImage.sd_setImage(with: url, completed: nil)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}






