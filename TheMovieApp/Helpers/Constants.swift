//
//  Constants.swift
//  TestMovieApi
//
//  Created by Richard Price on 27/03/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import Foundation

let APIKEY = "d9038095c8fe3fd8856cc87facc2f48b"
let APINOWPLAYING = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIKEY)&language=en-US&page=1"
let APITOPRATED = "https://api.themoviedb.org/3/movie/top_rated?api_key=d9038095c8fe3fd8856cc87facc2f48b&language=en-US&page=1"
let APIDISCOVER = "https://api.themoviedb.org/3/discover/movie?api_key=\(APIKEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"

//this is used to get poster images, just apend poster image
let BASEIMAGEURL = "http://image.tmdb.org/t/p/w185/"
