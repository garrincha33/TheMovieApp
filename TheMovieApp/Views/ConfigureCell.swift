//
//  ConfigureCell.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import Foundation

//step 12 create configure cell protocol

protocol ConfigureCell {
    static var reuseIdentifer: String { get }
    func configure(with movie: Movies)
}
