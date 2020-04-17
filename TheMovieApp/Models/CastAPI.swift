//
//  CastAPI.swift
//  TheMovieApp
//
//  Created by Richard Price on 16/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import Foundation

struct CastAPI: Codable {
    let id: Int
    let cast: [Cast]
}

struct CastResults: Codable {
    let CastResults: CastAPI
}
