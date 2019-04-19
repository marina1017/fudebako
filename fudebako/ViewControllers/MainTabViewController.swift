//
//  MainTabViewController.swift
//  fudebako
//
//  Created by nakagawa on 2019/04/20.
//  Copyright © 2019 中川万莉奈. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    var barItem: UITabBarItem = {
        var item = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        return item
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainVC = MainViewController()
        mainVC.tabBarItem = UITabBarItem(title: "メイン画面",
                                         image: UIImage(named: "tab_timer_items_inactive"),
                                         selectedImage: UIImage(named: "tab_timer_items_active"))


        let settingVC = SettingViewController()
        settingVC.tabBarItem = UITabBarItem(title: "設定",
                                            image: UIImage(named: "tab_setting_items_inactive"),
                                            selectedImage: UIImage(named: "tab_setting_items_active"))

        setViewControllers([UINavigationController(rootViewController: mainVC),
                            UINavigationController(rootViewController: settingVC)] , animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
