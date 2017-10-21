//
//  MessageVC.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit

class MessageVC: UIViewController,UIGestureRecognizerDelegate {
    //声明导航条
    var navigationBar:UINavigationBar?
    fileprivate func buildNavigationItem() {//242,71,28
        //设置状态栏颜色
        navigationBar = UINavigationBar(frame: CGRect(x:0, y:20, width:ScreenInfo.width, height:44))
        navigationBar?.barStyle  =  UIBarStyle.default
        //navigationBar!.setBackgroundImage(UIImage(named: "nav_f2471e.png"), for: UIBarMetrics.default)
        // 5.设置导航栏阴影图片
        //navigationBar!.shadowImage = UIImage()
        navigationBar!.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        navigationBar!.tintColor = UIColor.white
        onAdd()
        self.view.addSubview(navigationBar!)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.buildNavigationItem()
        navigationBar?.isTranslucent = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //手势：
        let GesTar = self.navigationController?.interactivePopGestureRecognizer!.delegate
        let Ges = UIPanGestureRecognizer(target:GesTar,
                                         action:Selector(("handleNavigationTransition:")))
        Ges.delegate = self
        self.view.addGestureRecognizer(Ges)
        //同时禁用系统原先的侧滑返回功能
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension MessageVC{
    func onAdd(){
        //给导航条增加导航项
        navigationBar?.pushItem(onMakeNavitem(), animated: true)
    }
    //创建一个导航项
    func onMakeNavitem()->UINavigationItem{
        var navigationItem = UINavigationItem()
        navigationItem.title = "消息"
        return navigationItem
    }
    //手势代码：
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return false
        }
        return true
    }
}
