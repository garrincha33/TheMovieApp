//
//  StretchyHeaderView.swift
//  TheMovieApp
//
//  Created by Richard Price on 14/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

//STEP 1 create a stretchyHeader view to hold image

class StretchyHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
