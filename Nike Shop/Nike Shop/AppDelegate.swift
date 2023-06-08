//
//  AppDelegate.swift
//  Nike Shop
//
//  Created by bakebrlk on 07.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

    
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: WelcomeView())
        
        return true
    }

//    private func updateBackButtonTitle(title: String) {
//           // Get the default appearance for UIBarButtonItem
//           let backButtonAppearance = UIBarButtonItem.appearance()
//
//           // Set the custom back button title position adjustment
//
//           // Set the custom back button title text attributes
//           backButtonAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
//
//           // Set the custom back button title
//           backButtonAppearance.title = title
//       }
    
    
       
}

