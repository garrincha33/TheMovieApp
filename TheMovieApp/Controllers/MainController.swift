//
//  MainController.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

//step 1 create a main controller and import assets and helper
class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //step 13 create a dummy item
    let items = Movies(title: "test", id: 2)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //step 2 give background color
        collectionView.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseIdentifer)

    }
    
    //step 2 super.init
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //step 14 number of items just return 1 for now
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
        
    }
    //step 15 set cell size you need flow delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: 50, height: 50)
        
    }
    
    //step 16 create func to create cell
    func configure<T: ConfigureCell>(_ cellType: T.Type, with app: Movies, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifer, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }

        cell.configure(with: app)
        return cell
    }

     //step 17 return your cell in cell for item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return configure(MovieCell.self, with: items, for: indexPath)
        
    }
}

//step 6 setup swift UI preview
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

