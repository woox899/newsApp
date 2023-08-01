//
//  FakeVC2.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 31.07.2023.
//

import UIKit

class FakeVC2: UIViewController {
    
    var fakeVC2TabBarItem = UITabBarItem()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)

        fakeVC2TabBarItem = UITabBarItem(title: "Following", image: UIImage(named: "following"), tag: 2)
        self.tabBarItem = fakeVC2TabBarItem
        view.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
