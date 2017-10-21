//
//  CustomTabBarVC.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit

class CustomTabBarVC: UITabBarController, TabBarItemsVDelegate {
    static var customTabBar = CustomTabBar()
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector:#selector(didTabChange(notification:)), name: NSNotification.Name(rawValue:"NotifyTabChange"), object: nil)
        createMainTabBarChildViewController()
        addCustomTabBar()
    }
    
    fileprivate func createMainTabBarChildViewController() {
        tabBarControllerAddChildViewController(FindVC())
        tabBarControllerAddChildViewController(FocusVC())
        //这个控制器暂时不起作用
        tabBarControllerAddChildViewController(UIViewController())
        tabBarControllerAddChildViewController(MessageVC())
        tabBarControllerAddChildViewController(MineVC())
    }
    fileprivate func tabBarControllerAddChildViewController(_ childView: UIViewController) {
        let navigationVC = UINavigationController(rootViewController:childView)
        self.addChildViewController(navigationVC)
    }
    
    
    /// 添加自定义tabBar
    func addCustomTabBar() {
        CustomTabBarVC.customTabBar.tabBarView.delegate = self
        self.setValue(CustomTabBarVC.customTabBar, forKey: "tabBar")
    }
    // MARK: MQLTabBarItemsViewDelegate
    func didSelectItemAtIndex(view: TabBarItemsV, index: Int) -> Void{
        self.selectedIndex = index
    }
    
    func didClickCenterItem(view: TabBarItemsV) -> Void{
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
            let postV = PostVC()
            //push方式
            self.navigationController?.pushViewController(postV , animated: true)
            //present方式
            //self.present(postV, animated: false, completion: nil)
        })
    }
    
}
