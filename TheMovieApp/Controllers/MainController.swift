//
//  MainController.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Select Genre", style: .plain, target: self, action: #selector(testingGenre))
        
        collectionView.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseIdentifer)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupDiffableDataSource()
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        
        
    }
    
    init() {
        //MARK:- compostional layout
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                return MainController.topSection()
            } else {
                return MainController.bottomSection()
            }
        }
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func testingGenre() {
        
    }
    
    func configure<T: ConfigureCell>(_ cellType: T.Type, with app: Movie, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifer, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: app)
        return cell
    }
    
    //MARK:- steup diffable datasource
    lazy var diffableDataSource: UICollectionViewDiffableDataSource<Section, AnyHashable> = .init(collectionView: collectionView) {(collectionView, indexPath, object) -> UICollectionViewCell? in
        
        if let obj = object as? Movie {
            switch indexPath.section {
            case 0:
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifer, for: indexPath) as! MovieCell
                cell.configure(with: obj)
                return cell
            default:
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifer, for: indexPath) as! MovieCell
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

        APIService.shared.fetchPlayingNowMovies { (playingNowGroup, err) in
            APIService.shared.fetchTopMovies { (movieGroup, err) in
                APIService.shared.fetchTrendingMovies { (trendingGroup, err) in
                    APIService.shared.fetchPopularMovies { (popularGroup, err) in
                        
                        var snapshot = self.diffableDataSource.snapshot()
                        snapshot.appendSections([.topSection, .bottomSection, .trendingSection, .popularSection])
                        
                        //MARK:- movies out now
                        let playingNowObjects = playingNowGroup?.results ?? []
                        snapshot.appendItems(playingNowObjects, toSection: .topSection)
                        //MARK:- top rated movies
                        let objects = movieGroup?.results ?? []
                        snapshot.appendItems(objects, toSection: .bottomSection)
                        //MARK:- trending movies
                        let trendingObjects = trendingGroup?.results ?? []
                        snapshot.appendItems(trendingObjects, toSection: .trendingSection)
                        //MARK:- popular movies
                        let popularObjects = popularGroup?.results ?? []
                        snapshot.appendItems(popularObjects, toSection: .popularSection)
                        
                        self.diffableDataSource.apply(snapshot)
                        
                    }
                }
            }
        }
    }
    //Step 6 transiti9on over to your movie details controller by movie id
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = diffableDataSource.itemIdentifier(for: indexPath)
        if let object = object as? Movie {
            let controller = MovieDetailsController(movieId: object.id ?? 0)
            print("Movie is \(object.title ?? "")")
            navigationController?.pushViewController(controller, animated: true)

        }
    }
}

import SwiftUI
struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return MainController()
        }
        
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
            
        }
        
    }
}

