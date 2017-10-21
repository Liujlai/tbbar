
//
//  SettingVC.swift
//  Maps
//
//  Created by test on 2017/10/16.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit
//UIGestureRecognizerDelegate
class SettingVC: UIViewController,UIGestureRecognizerDelegate{
    var rightBtn:UIButton?
    //声明导航条
    var navigationBar:UINavigationBar?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil);
        // Do any additional setup after loading the view.
        //手势：
        let GesTar = self.navigationController?.interactivePopGestureRecognizer!.delegate
        let Ges = UIPanGestureRecognizer(target:GesTar,
                                         action:Selector(("handleNavigationTransition:")))
        Ges.delegate = self
        self.view.addGestureRecognizer(Ges)
        //同时禁用系统原先的侧滑返回功能
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBar?.isTranslucent = false
        navigationBar?.barStyle  =  UIBarStyle.default
        // 5.设置导航栏阴影图片
        //navigationBar?.shadowImage = UIImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension SettingVC{
    func setUpUI(){
        //self.buildNavigationItem()
        navigationBar = UINavigationBar(frame: CGRect(x:0, y:20, width:ScreenInfo.width, height:44))
        self.view.addSubview(navigationBar!)
        onAdd()
    }
    
    func onAdd(){
        //给导航条增加导航项
        navigationBar?.pushItem(onMakeNavitem(), animated: true)
    }
    //创建一个导航项
    func onMakeNavitem()->UINavigationItem{
        var navigationItem = UINavigationItem()
        //设置导航栏标题
        navigationItem.title = "设置设置"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"icon_return.png"), style: .plain, target: self, action: #selector(popToPrevCtrl))
        
        rightBtn = UIButton(frame: CGRect(x:0, y:0, width:36, height:24))
        rightBtn!.setTitle("消息", for: .normal)
        rightBtn!.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        rightBtn!.setTitleColor(UIColor.colorWithCustom(242, g: 71, b: 30), for: .normal)
        //rightBtn!.addTarget(self, action: "toMessage", for: .touchUpInside)
        let rightItem:UIBarButtonItem = UIBarButtonItem(customView: rightBtn!)
        self.navigationItem.rightBarButtonItem = rightItem
        return navigationItem
    }
    @objc func popToPrevCtrl() {
        _ = navigationController?.popViewController(animated: true)
    }
    @objc func goBack() {
        DispatchQueue.main.async{
            self.navigationController?.popViewController(animated: true)
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

