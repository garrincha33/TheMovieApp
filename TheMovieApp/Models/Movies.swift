//
//  Movies.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

struct Movies: Codable {
    
    var title: String? = "TESTTTTTTT"
    var id: Int?
    
}

struct MoviesAPI: Codable, Hashable {
    let page: Int
    let results: [Movie]
}
