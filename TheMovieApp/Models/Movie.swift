//
//  Movie.swift
//  TestMovieApi
//
//  Created by Richard Price on 27/03/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import Foundation

//step 8 add main api call, this should match the movevie DB results exactly

//this struct will always be the attibutes you are trying to access within the JSON
// if there is a [Results] array holding these, create a 2nd struct conforming to COdable
struct Movie: Codable, Hashable {
    var id: Int?
    var poster_path: String?
    var videoPath: String?
    var backdrop: String?
    var title: String?
    var release_date: String?
    var rating: Double?
    var overView: String?
}
