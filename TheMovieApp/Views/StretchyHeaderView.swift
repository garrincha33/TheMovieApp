//
//  StretchyHeaderView.swift
//  TheMovieApp
//
//  Created by Richard Price on 14/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class StretchyHeaderView: UICollectionReusableView {
    
    
    //step 2 create an imageView for a dummy image
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "dummyheader"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

    
    
}
