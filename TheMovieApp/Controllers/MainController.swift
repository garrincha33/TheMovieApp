//
//  MainController.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

   // var movies = [Movie]()
//    var topMovies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Genre", style: .plain, target: self, action: #selector(testingGenre))
        
        collectionView.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseIdentifer)
        collectionView.register(TopRatedMovieCell.self, forCellWithReuseIdentifier: TopRatedMovieCell.reuseIdentifer)
        //navigationItem.title = "Movies Out Now"
        navigationController?.navigationBar.prefersLargeTitles = true
        //getMovies()
        setupDiffableDataSource()
        
        //HEADER  //step 4 register the header
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

//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return movies.count
//
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return .init(width: view.frame.width, height: 100)
//
//    }
    
    @objc private func testingGenre() {
        
    }
    
    func configure<T: ConfigureCell>(_ cellType: T.Type, with app: Movie, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifer, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: app)
        return cell
    }

//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifer, for: indexPath) as! MovieCell
//        cell.item = movies[indexPath.row]
//        return cell
//
//        //return configure(MovieCell.self, with: movies, for: indexPath)
//
//    }

//    private func getMovies() {
//        APIService.shared.fetchMovies(completionHandler: { (movie, err) in
//
//            if let err = err {
//                print("unable to getch mopvies",err)
//            }
//
//            guard let moviess = movie else {return}
//            for _ in moviess {
//                self.movies = moviess
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                    }
//                }
//            })
//        }
  
    //MARK:- steup diffable datasource
    lazy var diffableDataSource: UICollectionViewDiffableDataSource<Section, AnyHashable> = .init(collectionView: collectionView) {(collectionView, indexPath, object) -> UICollectionViewCell? in
        
        if let obj = object as? Movie {
            switch indexPath.section {
            case 0:
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifer, for: indexPath) as! MovieCell
                cell.configure(with: obj)
                return cell
                //BOTTOM SECTION
            case 1:
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: TopRatedMovieCell.reuseIdentifer, for: indexPath) as! TopRatedMovieCell
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
        
        APIService.shared.fetchMovies { (movies, err) in

            APIService.shared.fetchTopMovies { (movieGroup, err) in
                
                var snapshot = self.diffableDataSource.snapshot()
                snapshot.appendSections([.topSection])
                snapshot.appendItems(movies ?? [], toSection: .topSection)

                snapshot.appendSections([.bottomSection])
                let objects = movieGroup?.results ?? []
                snapshot.appendItems(objects, toSection: .bottomSection)
                
                self.diffableDataSource.apply(snapshot)
            }
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

