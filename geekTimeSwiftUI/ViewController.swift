//
//  ViewController.swift
//  geekTimeSwiftUI
//
//  Created by Ben Lv on 2020/1/27.
//  Copyright © 2020 ruibo. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.image = R.image.home()
        homeVC.tabBarItem.selectedImage = R.image.home_selected()?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)
        homeVC.tabBarItem.title = "首页"
        
        let navigationHomeVC = UINavigationController(rootViewController: homeVC)
        self.addChild(navigationHomeVC)
        
        let mineVC = MineViewController()
        mineVC.tabBarItem.image = R.image.mine()
        mineVC.tabBarItem.selectedImage = R.image.mine_selected()?.withRenderingMode(.alwaysOriginal)
        mineVC.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)
        mineVC.tabBarItem.title = "我的"
        let navigationMineVC = UINavigationController(rootViewController: mineVC)
        self.addChild(navigationMineVC)
        


    }
    
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
