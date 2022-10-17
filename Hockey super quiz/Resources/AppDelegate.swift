//
//  AppDelegate.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 08/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var restrictRotation:UIInterfaceOrientationMask = .portrait

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if NullCheck.checkNullNil(AppleLanguage) == false
        {
            Constants.kUserDefaults .set("en", forKey: "AppleLanguage")
            Constants.kUserDefaults.synchronize()
        }
        if #available(iOS 13, *) {
            // do only pure app launch stuff, not interface stuff
        } else {
            self.MenuScreen()
        }
        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
    {
        return self.restrictRotation
    }

    func MenuScreen()
    {
        print("called")
        UIApplication.shared.windows.first?.rootViewController = nil
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = UINavigationController()
        let Controller = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        navigationController.setViewControllers([Controller], animated: false)
        navigationController.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

