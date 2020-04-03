//
//  MainTabBarController.swift
//  TheMovieApp
//
//  Created by Richard Price on 02/04/2020.
//  Copyright © 2020 twisted echo. All rights reserved.
//

import UIKit

//step 4 create a main tab bar controller
class MainTabBarController: UITabBarController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        //step 9 set color and call functions
        view.backgroundColor = UIColor.rgb(red: 20, green: 20, blue: 20)
        setupNavBarControllerCustom()
        setupTabBarController()
    }
 //step 8 setup large titles
    private func setupNavBarControllerCustom() {
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
    }

    //step 7 setup tab bar controller with function
    private func setupTabBarController() {
        viewControllers = [
            setupNavigationControllers(with: MainController(), title: "Movies", image: #imageLiteral(resourceName: "movieFeature")),
            setupNavigationControllers(with: UIViewController(), title: "Search", image: #imageLiteral(resourceName: "movieSearch1"))

        ]
        tabBar.tintColor = UIColor.rgb(red: 144, green: 202, blue: 19)
        tabBar.barTintColor = .clear

    }

    //step 5 setup naviation creating function
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

//step 6 setup swift UI preview
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
