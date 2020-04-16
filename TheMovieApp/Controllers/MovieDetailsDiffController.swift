//
//  MovieDetailsDiffController.swift
//  TheMovieApp
//
//  Created by Richard Price on 16/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MovieDetailsDiffController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let movieId: Int
    var movie: Movie?
    
    init(movieId: Int) {
        self.movieId = movieId
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDiffableDataSource()
        collectionView.register(MovieDetailsCell.self, forCellWithReuseIdentifier: MovieDetailsCell.reuseIdentifer)
        
        collectionView.register(StretchyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StretchyHeaderView.reuseIdentifier)
        
        collectionView.backgroundColor = .purple
        

    }

    func configure<T: ConfigureCell>(_ cellType: T.Type, with app: Movie, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifer, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: app)
        return cell
    }
    
    //MARK:- steup diffable datasource
       lazy var diffableDataSource: UICollectionViewDiffableDataSource<Section, Movie?> = .init(collectionView: collectionView) {(collectionView, indexPath, object) -> UICollectionViewCell? in
           
        if let obj = object {
               switch indexPath.section {
               case 1:
                   let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCell.reuseIdentifer, for: indexPath) as! MovieDetailsCell
                   cell.configure(with: obj)
                   return cell
               default:
                   let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCell.reuseIdentifer, for: indexPath) as! MovieDetailsCell
                   cell.configure(with: obj)
                   return cell
               }
           }
           return nil
       }
    
    private func setupDiffableDataSource() {
    collectionView.dataSource = diffableDataSource
    //MARK:- SetupHeader under Compositional Sections Extension
        setupHeader()
        let urlString = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(APIKEY)&language=en-US"
        APIService.shared.fetchGenericJSONData(urlString: urlString) { (result: Movie?, err) in
            self.movie = result
            print("MOVIE RETUREND - \(self.movie?.title ?? "")")
            
            var snapshot = self.diffableDataSource.snapshot()
            snapshot.appendSections([.BottomSection])
            snapshot.appendItems([self.movie])

        }
    }
}

extension MovieDetailsDiffController {
enum Section {
    case HeaderSection
    case BottomSection
    }
    
    func setupHeader() {
        diffableDataSource.supplementaryViewProvider = .some({ (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StretchyHeaderView.reuseIdentifier, for: indexPath) as? StretchyHeaderView else {
                return nil
            }
            switch indexPath.section {
            case 0:
                sectionHeader.imageView = UIImageView(image: #imageLiteral(resourceName: "dummyheader"))
            default:
                sectionHeader.imageView = UIImageView(image: #imageLiteral(resourceName: "dummyheader"))
            }
            return sectionHeader
        })
    }
    
}
