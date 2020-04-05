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

//step 9 add another stuct to store an array of the results
struct MoviesAPI: Codable, Hashable {
    let page: Int
    let results: [Movie]
}
