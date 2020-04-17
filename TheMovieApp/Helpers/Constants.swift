//
//  Constants.swift
//  TestMovieApi
//
//  Created by Richard Price on 27/03/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import Foundation

let APIKEY = "d9038095c8fe3fd8856cc87facc2f48b"
let APINOWPLAYING = "https://api.themoviedb.org/3/movie/now_playing?api_key=d9038095c8fe3fd8856cc87facc2f48b&language=en-US&page=1"
let APITOPRATED = "https://api.themoviedb.org/3/movie/top_rated?api_key=d9038095c8fe3fd8856cc87facc2f48b&language=en-US&page=1"
let APIPOPULAR = "https://api.themoviedb.org/3/movie/popular?api_key=d9038095c8fe3fd8856cc87facc2f48b&language=en-US&page=1"
let APITRENDING = "https://api.themoviedb.org/3/trending/all/day?api_key=d9038095c8fe3fd8856cc87facc2f48b"
let APIDISCOVER = "https://api.themoviedb.org/3/discover/movie?api_key=\(APIKEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
//API SEARCH + your search term + &page=1 + APISEARCH2
let APISEARCH1  = "https://api.themoviedb.org/3/search/movie?api_key=\(APIKEY)&language=en-US&query="
let APISEARCH2 = "&include_adult=false"

let APIID = "https://api.themoviedb.org/3/movie/28?api_key=\(APIKEY)&language=en-US"
let CASTAPI = "https://api.themoviedb.org/3/movie/50855/credits?api_key=d9038095c8fe3fd8856cc87facc2f48b"

//----------
//this is used to get poster images, just apend poster image
let BASEIMAGEURL = "http://image.tmdb.org/t/p/w185/"
let BASEPROFILEIMAGE = "https://image.tmdb.org/t/p/w45/eT15ERUT5T3CVyf2a9JD1VAzC6q.jpg"
