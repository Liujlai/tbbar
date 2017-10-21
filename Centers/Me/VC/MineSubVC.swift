//
//  MineSubVC.swift
//  Centers
//
//  Created by test on 2017/9/30.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit
//利用代理传值
class MineSubVC: UIViewController,UIGestureRecognizerDelegate{
//UIGestureRecognizerDelegate
    //声明导航条
    var navigationBar:UINavigationBar?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.title = "订阅中心"
        self.view.backgroundColor = UIColor.white
        //手势：
        let GesTar = self.navigationController?.interactivePopGestureRecognizer!.delegate
        let Ges = UIPanGestureRecognizer(target:GesTar,
                                         action:Selector(("handleNavigationTransition:")))
        Ges.delegate = self
        self.view.addGestureRecognizer(Ges)
        //同时禁用系统原先的侧滑返回功能
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationBar?.isTranslucent = false
        // 5.设置导航栏阴影图片
        //navigationBar?.shadowImage = UIImage()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension MineSubVC{
    func setUpUI(){
        navigationBar = UINavigationBar(frame: CGRect(x:0, y:20, width:ScreenInfo.width, height:44))
        self.view.addSubview(navigationBar!)
        onAdd()
        let firstBtn = UIButton()
        firstBtn.frame = CGRect(x: 20, y: 100, width: ScreenInfo.width/3, height: 40)
        firstBtn.backgroundColor = UIColor.red
        firstBtn.setTitle("点击测试", for: .normal)
        firstBtn.addTarget(self, action:#selector(sendNotice(_:)), for:.touchUpInside)
        firstBtn.titleLabel?.textColor = UIColor.white
        self.view.addSubview(firstBtn)
    }
    func onAdd(){
        //给导航条增加导航项
        navigationBar?.pushItem(onMakeNavitem(), animated: true)
    }
    //创建一个导航项
    func onMakeNavitem()->UINavigationItem{
        var navigationItem = UINavigationItem()
        //设置导航栏标题
        navigationItem.title = "测试返回按钮"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"icon_return.png"), style: .plain, target: self, action: #selector(popToPrevCtrl))
        return navigationItem
    }
    @objc func popToPrevCtrl() {
        _ = navigationController?.popViewController(animated: true)
    }
    @objc func sendNotice(_:UIButton){
        //发送通知
        SnailNotice.post(notification: .happy,object: nil,passDicts: ["success":"true"])
        let setSubV = SettingVC()
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setSubV , animated: true)
        //self.hidesBottomBarWhenPushed = false
    }
    //手势代码：
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return false
        }
        return true
    }
}

