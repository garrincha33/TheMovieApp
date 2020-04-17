//
//  Cast.swift
//  TheMovieApp
//
//  Created by Richard Price on 16/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import Foundation

struct Cast: Codable, Hashable {
    var cast_id: Int?
    var character: String?
    var credit_id: String?
    var gender: Int?
    var id: Int?
    var name: String?
    var order: Int?
    var profile_path: String?
}
