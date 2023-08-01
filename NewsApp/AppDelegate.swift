//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 26.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let presenter: NewsListPresenterProtocol = NewsListPresenter()
        let vc: NewsListViewControllerProtocol = NewsListViewController(presenter: presenter)
        presenter.viewController = vc
        
        let fakeVC1 = FakeVC1()
        let fakeVC2 = FakeVC2()
        
        let tabBarVC = UITabBarController()
        
        let nav = UINavigationController(rootViewController: vc as! UIViewController)
        tabBarVC.setViewControllers([nav, fakeVC1, fakeVC2], animated: true)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        return true
    }
    
}
