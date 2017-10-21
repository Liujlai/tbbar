//
//  FindVC.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit
class FindVC: UIViewController,UIGestureRecognizerDelegate{
    lazy var findV: FindV = {[weak self] in
        let Frame = CGRect(x: 0, y: 0, width: ScreenInfo.width, height: ScreenInfo.height)
        let findV = FindV(frame: Frame)
        findV.findVDelegate = self
        return findV
    }()
    //增加通知
    var myObserver:Bool? {
        didSet {
            _ = SnailNotice.add(observer: self, selector: #selector(FindVC.reload(notification:)), notification: .happy)
        }
    }
    //声明导航条
    var navigationBar:UINavigationBar?
    fileprivate func buildNavigationItem() {//242,71,28
        //设置状态栏颜色
        navigationBar = UINavigationBar(frame: CGRect(x:0, y:20, width:ScreenInfo.width, height:44))
        navigationBar?.barStyle  =  UIBarStyle.default
        navigationBar!.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        navigationBar!.tintColor = UIColor.black
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
        self.setupUI()
        self.view.backgroundColor = UIColor.white
        myObserver = true //开启所有观察
        //手势：
        let GesTar = self.navigationController?.interactivePopGestureRecognizer!.delegate
        let Ges = UIPanGestureRecognizer(target:GesTar,
                                         action:Selector(("handleNavigationTransition:")))
        Ges.delegate = self
        self.view.addGestureRecognizer(Ges)
        //同时禁用系统原先的侧滑返回功能
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
    }
    //移除通知
    deinit {
        SnailNotice.remove(observer: self, notification: .tabJump)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FindVC:FindVDelegate{
    func setupUI(){
        self.view.addSubview(findV)
    }
    func onAdd(){
        //给导航条增加导航项
        navigationBar?.pushItem(onMakeNavitem(), animated: true)
    }
    //创建一个导航项
    func onMakeNavitem()->UINavigationItem{
        var navigationItem = UINavigationItem()
        navigationItem.title = "发现"
        return navigationItem
    }
    func toSub(findV: FindV) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
            let subV = SubVC()
            //push方式
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(subV , animated: true)
            self.hidesBottomBarWhenPushed = false
        })
    }
    func toTab(findV: FindV) {
        self.tabBarController?.selectedIndex = 1
        //取消第一个tabItem的颜色
        CustomTabBarVC.customTabBar.tabBarView.btns[0].isSelected = false
        //增加第二个tabItem的颜色
        CustomTabBarVC.customTabBar.tabBarView.btns[1].isSelected = true
        CustomTabBarVC.customTabBar.tabBarView.tabBarItemClicked(sender: CustomTabBarVC.customTabBar.tabBarView.btns[1])
    }
    @objc func reload(notification:NSNotification) {
        let dict = notification.userInfo //获取通self知的信息
        if String(describing: dict!["success"]!)=="true" {
            print("收到通知执行的方法")
        }
    }
    //手势代码：
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return false
        }
        return true
    }
}
