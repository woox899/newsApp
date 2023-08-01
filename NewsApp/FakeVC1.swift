//
//  FakeVC1.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 31.07.2023.
//

import UIKit

class FakeVC1: UIViewController {
    
    var fakeVC1TabBarItem = UITabBarItem()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .red
        fakeVC1TabBarItem = UITabBarItem(title: "News+", image: UIImage(named: "news+"), tag: 1)
        self.tabBarItem = fakeVC1TabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
