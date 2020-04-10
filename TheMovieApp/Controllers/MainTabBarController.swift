//
//  MainTabBarController.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit
class MainTabBarController: UITabBarController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        setupNavBarControllerCustom()
        setupTabBarController()
    }

    private func setupNavBarControllerCustom() {
        
        //UINavigationBar.appearance().prefersLargeTitles = true
        
    }

    private func setupTabBarController() {
        viewControllers = [
            setupNavigationControllers(with: MainController(), title: "Movies", image: #imageLiteral(resourceName: "movieFeature")),
            setupNavigationControllers(with: UIViewController(), title: "Search", image: #imageLiteral(resourceName: "movieSearch1"))

        ]
        tabBar.tintColor = UIColor.rgb(red: 144, green: 202, blue: 19)
        tabBar.barTintColor = .clear

        //step 1 adjust tab bar items title and image size
        guard let items = tabBar.items else {return}
               for item in items {
                   item.imageInsets = UIEdgeInsets(top: 18, left: 0, bottom: -8, right: 0)
               }
        guard let titleItems = tabBar.items else {return}
        for items in titleItems {
            items.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 14)
        }
    }

    private func setupNavigationControllers(with rootViewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

}

import SwiftUI
struct MainPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreviews.ContainerView>) -> UIViewController {
            return MainTabBarController()
        }
        
        
        func updateUIViewController(_ uiViewController: MainPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreviews.ContainerView>) {
            
        }
        
    }
}
