//
//  BaseTabbarViewController.swift
//  Buoi11
//
//  Created by Quân on 11/14/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabbar()
    }
   
    func setupTabbar(){
        
        // xac dinh viewcontroller
        let Yellow = Main_Storyboard.instantiateViewController(withIdentifier: "YellowViewController") as! YellowViewController
        // setup items
        Yellow.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 100)
        // cho vao navigation view controllers
        let navYellow = BaseNavigationViewController(rootViewController: Yellow)
        
        // xac dinh viewcontroller
        let Blue = Main_Storyboard.instantiateViewController(withIdentifier: "BlueViewController") as! BlueViewController
        // setup items
        Blue.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 200)
        // cho vao navigation view controllers
        let navBlue = BaseNavigationViewController(rootViewController: Blue)
        
        
        
        // cho vao tabbar view controllers
        self.viewControllers = [navYellow, navBlue]
        
    }

}
