//
//  APIService.swift
//  TestMovieApi
//
//  Created by Richard Price on 27/03/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    //always pass in your first API so the one which holds title, release date ect
    func fetchMovies(completionHandler: @escaping ([Movie]?, Error?) -> ()) {

        guard let url = URL(string: APINOWPLAYING) else {
            print("not a valid url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {//when Decoding use the 2nd API model with the array 
                if let decodedResponse = try? JSONDecoder().decode(MoviesAPI.self, from: data) {
                    DispatchQueue.main.async {
                        completionHandler(decodedResponse.results, nil)
                        
                    }
                    return
                }
            }
            print("Fatch Failed \(error?.localizedDescription ?? "error unknown")")
        }.resume()
        
    }
    
    
    func fetchMoviesTop(completionHandler: @escaping ([Movie]?, Error?) -> ()) {

        guard let url = URL(string: APITOPRATED) else {
            print("not a valid url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {//when Decoding use the 2nd API model with the array
                if let decodedResponse = try? JSONDecoder().decode(MoviesAPI.self, from: data) {
                    DispatchQueue.main.async {
                        completionHandler(decodedResponse.results, nil)
                        
                    }
                    return
                }
            }
            print("Fatch Failed \(error?.localizedDescription ?? "error unknown")")
        }.resume()
        
    }
    
    
    //helper
    func fetchAppGroup(urlString: String, completion: @escaping (Movies?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopMovies(completion: @escaping (Movies?, Error?) -> ()) {
        let urlString = APITOPRATED
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}
