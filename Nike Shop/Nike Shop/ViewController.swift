//
//  ViewController.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit

class ViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        

        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        navigationItem.hidesBackButton = true
        setupViewControllers()
    }
    

    func setupViewControllers() {
        viewControllers = [
            wrapInNavigationController(with: CatalogView(), tabTitle: "Catalog", tabImage: UIImage(systemName: "house")!),
            wrapInNavigationController(with: CartView(), tabTitle: "Cart", tabImage: UIImage(systemName: "cart")!),
            wrapInNavigationController(with: ProfileView(), tabTitle: "Profile", tabImage: UIImage(systemName: "person")!),
        ]
    }

    func wrapInNavigationController(with rootViewController: UIViewController,
                                    tabTitle: String,
                                    tabImage: UIImage) -> UINavigationController
    {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = tabImage
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationController?.title = tabTitle
        return navigationController
    }
}


