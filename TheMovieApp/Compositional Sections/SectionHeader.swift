//
//  SectionHeader.swift
//  TestMovieApi
//
//  Created by Richard Price on 30/03/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeader"
    var title = UILabel()
    var genre = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderLayout()
 
    }
    
    private func setupHeaderLayout() {
        let seperator = UIView(frame: .zero)
              seperator.translatesAutoresizingMaskIntoConstraints = false
              seperator.backgroundColor = .quaternaryLabel
              
              title.textColor = .white
              title.font = UIFont(name: "Slabo27px-Regular", size: 24)

              let stackView = UIStackView(arrangedSubviews: [title])
              stackView.translatesAutoresizingMaskIntoConstraints = false
              stackView.axis = .vertical
              stackView.distribution = .fillEqually
              addSubview(stackView)
              
              NSLayoutConstraint.activate([
                  stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
                  stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
              stackView.topAnchor.constraint(equalTo: topAnchor),
              stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
              
              ])
              
              stackView.setCustomSpacing(35, after: title)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented not using storyboards")
    }
    
}
