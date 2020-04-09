//
//  SectionHeader.swift
//  TestMovieApi
//
//  Created by Richard Price on 30/03/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

//step 1 create a section header

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeader"
    var title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderLayout()
 
    }
    
    private func setupHeaderLayout() {
        let seperator = UIView(frame: .zero)
              seperator.translatesAutoresizingMaskIntoConstraints = false
              seperator.backgroundColor = .quaternaryLabel
              
              title.textColor = .white
              title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
              
              let stackView = UIStackView(arrangedSubviews: [title])
              stackView.translatesAutoresizingMaskIntoConstraints = false
              stackView.axis = .vertical
              addSubview(stackView)
              
              NSLayoutConstraint.activate([
                  stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                  stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
              stackView.topAnchor.constraint(equalTo: topAnchor),
              stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
              
              ])
              
              stackView.setCustomSpacing(15, after: seperator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented not using storyboards")
    }
    
}
