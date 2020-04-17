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
    var casting = [Cast]()
    
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
    lazy var diffableDataSource: UICollectionViewDiffableDataSource<Section, AnyHashable?> = .init(collectionView: collectionView) {(collectionView, indexPath, object) -> UICollectionViewCell? in
        
        if let obj = object as? Movie {
            switch indexPath.section {
            case 0:
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCell.reuseIdentifer, for: indexPath) as! MovieDetailsCell
                cell.configure(with: obj)
                return cell
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
        //setupHeader()
        let urlString = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(APIKEY)&language=en-US"
        let urlCastString = "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=d9038095c8fe3fd8856cc87facc2f48b"
        APIService.shared.fetchGenericJSONData(urlString: urlString) { (result: Movie?, err) in
            self.movie = result
            APIService.shared.fetchGenericJSONData(urlString: urlCastString) { (result: CastAPI?, err) in
                guard let people = result else {return}
                
                people.cast.forEach { (p) in
                    self.casting.append(p)
                }
                
                var snapshot = self.diffableDataSource.snapshot()
                snapshot.appendSections([.HeaderSection, .BottomSection])
                
                snapshot.appendItems([self.movie])
                snapshot.appendItems([self.casting])
                
                

                self.diffableDataSource.apply(snapshot)
                
            }
        }
    }
}

extension MovieDetailsDiffController {
    enum Section {
        case HeaderSection
        case BottomSection
    }
    
    static func HeaderSection() -> NSCollectionLayoutSection {
        let items = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        items.contentInsets.bottom = 16
        items.contentInsets.trailing = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.60), heightDimension: .absolute(400)), subitems: [items])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.leading = 16
        section.contentInsets.bottom = 32
        section.contentInsets.top = 16
        
        
//        //MARK:-HEADER SETUP----------------TOP
//                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20))
//                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//                section.boundarySupplementaryItems = [layoutSectionHeader]
//
        return section
    }
    
    static func bottomSection() -> NSCollectionLayoutSection {
           let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
           item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 32)
           
           let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.50), heightDimension: .absolute(400)), subitems: [item])
           
           let section = NSCollectionLayoutSection(group: group)
           section.orthogonalScrollingBehavior = .groupPaging
           section.contentInsets.leading = 16
           section.contentInsets.bottom = 32
           section.contentInsets.top = 16
    
           //MARK:-HEADER SETUP----------------BOTTOM
//           let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
//           let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//           section.boundarySupplementaryItems = [layoutSectionHeader]
           //----------------------------------
           return section
    }
    
//    func setupHeader() {
//        diffableDataSource.supplementaryViewProvider = .some({ (collectionView, kind, indexPath) -> UICollectionReusableView? in
//            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StretchyHeaderView.reuseIdentifier, for: indexPath) as? StretchyHeaderView else {
//                return nil
//            }
//            switch indexPath.section {
//            case 0:
//                sectionHeader.imageView = UIImageView(image: #imageLiteral(resourceName: "dummyheader"))
//            default:
//                sectionHeader.imageView = UIImageView(image: #imageLiteral(resourceName: "dummyheader"))
//            }
//            return sectionHeader
//        })
//    }
    
}
