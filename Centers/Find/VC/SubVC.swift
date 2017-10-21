//
//  SubVC.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit
//UIGestureRecognizerDelegate
class SubVC: UIViewController,UIGestureRecognizerDelegate{
    //声明导航条
    var navigationBar:UINavigationBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.view.backgroundColor = UIColor.white
        //self.navigationController?.interactivePopGestureRecognizer!.delegate = self
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
    }
    //移除通知
    deinit {
        SnailNotice.remove(observer: self, notification: .happy)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension SubVC{
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
        //创建左边按钮
        let button =   UIButton(type: .system)
        button.frame = CGRect(x:0, y:0, width:100, height:30)
        //button.backgroundColor = UIColor.cyan
        button.setImage(UIImage(named:"icon_fanhui_default"), for: .normal)
        button.imageView?.contentMode = .left
        button.addTarget(self, action: #selector(SubVC.goBack), for: .touchUpInside)
        let leftBarBtn = UIBarButtonItem(customView: button)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                     action: nil)
        spacer.width = -48;
        //设置导航栏标题
        navigationItem.title = "第1个导航项"
        navigationItem.leftBarButtonItems = [spacer,leftBarBtn]
        //取消iOS11返回按钮的bug
        if #available(iOS 11.0, *) {
            button.setTitle("\nbsp\nbsp\nbsp\nbsp\nbsp\nbsp\nbsp\nbsp\nbsp\nbsp\nbsp\nbsp我我我我", for: .normal)
        }
        return navigationItem
    }
    @objc func goBack() {
        DispatchQueue.main.async{
            self.navigationController?.popViewController(animated: true)
        }
    }
    @objc func sendNotice(_:UIButton){
        //发送通知
        SnailNotice.post(notification: .happy,object: nil,passDicts: ["success":"true"])
    }
    //手势代码：
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return false
        }
        return true
    }
}
