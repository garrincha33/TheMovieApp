//
//  MovieDetailsController.swift
//  TheMovieApp
//
//  Created by Richard Price on 13/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MovieDetailsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    fileprivate let padding: CGFloat = 16
    fileprivate let movieId: Int
    
    var movie: Movie?

    init(movieId: Int) {
        self.movieId = movieId
        super.init()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        collectionView.register(MovieDetailsCell.self, forCellWithReuseIdentifier: MovieDetailsCell.reuseIdentifer)
        collectionView.register(StretchyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.contentInsetAdjustmentBehavior = .never
    }

    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionViewLayout()
        setupCollectionView()
        fetchMovieDetails()

    }
    
    fileprivate func fetchMovieDetails() {
        let urlString = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(APIKEY)&language=en-US"
        APIService.shared.fetchGenericJSONData(urlString: urlString) { (result: Movie?, err) in
            
            self.movie = result
            print("Fetch Movie \(self.movieId)")
            print("Fetch Movie Name \(self.movie?.title ?? "")")
            print("FROM - \(urlString)")
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCell.reuseIdentifer, for: indexPath) as! MovieDetailsCell
        
        if let movie = movie {
            cell.configure(with: movie)
            return cell
        }
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
        
    }
    
    func configure<T: ConfigureCell>(_ cellType: T.Type, with app: Movie, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifer, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: app)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
}
