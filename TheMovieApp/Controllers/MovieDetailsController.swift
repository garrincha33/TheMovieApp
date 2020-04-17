//
//  MovieDetailsController.swift
//  TheMovieApp
//
//  Created by Richard Price on 13/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MovieDetailsController: BaseListController, UICollectionViewDelegateFlowLayout {

    fileprivate let padding: CGFloat = 16
    fileprivate let movieId: Int

    var movie: Movie?
    var cast: Cast?
    
    var casting = [Cast]()
    var movies = [Movie]()
    

    init(movieId: Int) {
        self.movieId = movieId
        super.init()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        collectionView.register(MovieDetailsCell.self, forCellWithReuseIdentifier: MovieDetailsCell.reuseIdentifer)

        collectionView.register(StretchyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StretchyHeaderView.reuseIdentifier)
        collectionView.contentInsetAdjustmentBehavior = .never
    }

    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchCastDetails()
        setupCollectionViewLayout()
        setupCollectionView()
        fetchMovieDetails()
        
    }

    fileprivate func fetchMovieDetails() {
        let urlString = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(APIKEY)&language=en-US"
        APIService.shared.fetchGenericJSONData(urlString: urlString) { (result: Movie?, err) in
            self.movie = result
            guard let m = self.movie else {return}
            self.movies.append(m)
            self.fetchCastDetails()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    fileprivate func fetchCastDetails() {
        let urlCastString = "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=d9038095c8fe3fd8856cc87facc2f48b"
        APIService.shared.fetchGenericJSONData(urlString: urlCastString) { (result: CastAPI?, err) in
            guard let people = result else {return}
            people.cast.forEach { (p) in
                self.casting.append(p)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCell.reuseIdentifer, for: indexPath) as! MovieDetailsCell
        cell.movieItems = movies[indexPath.row]
        //cell.castItems = casting[indexPath.row]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 350)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StretchyHeaderView.reuseIdentifier, for: indexPath)
        return header
    }
    
//    func configure<T: ConfigureCell>(_ cellType: T.Type, with app: Movie, for indexPath: IndexPath) -> T {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifer, for: indexPath) as? T else {
//            fatalError("Unable to dequeue \(cellType)")
//        }
//        cell.configure(with: app)
//        return cell
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
}
