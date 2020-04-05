//
//  MainController.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var movies = [Movies]()
    
    //step 1 create am arrary of items
    let items = [

        Movies(title: "test", id: 1),
        Movies(title: "two", id: 2),
        Movies(title: "three", id: 3),
        Movies(title: "four", id: 4),
        Movies(title: "four", id: 4),
        Movies(title: "four", id: 4),
        Movies(title: "four", id: 4),
        Movies(title: "four", id: 4),
        Movies(title: "four", id: 4)

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseIdentifer)
        
        getMovies()

    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //step 5 make it look more like a cell
        return .init(width: view.frame.width, height: 250)
        
    }

    //step 2 change to array of movies
    func configure<T: ConfigureCell>(_ cellType: T.Type, with app: [Movies], for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifer, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }

        cell.configure(with: app)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return configure(MovieCell.self, with: items, for: indexPath)
        
    }
    //step 10 create api service function and call in view did load
    private func getMovies() {
        APIService.shared.fetchMovies(completionHandler: { (movie, err) in
            
            if let err = err {
                print("unable to getch mopvies",err)
            }
            guard let movies = movie else {return}
            for m in movies {
                print("these are you movies \(m.title ?? "")")
                }
            })
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

