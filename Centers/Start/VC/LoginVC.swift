//
//  LoginVC.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    lazy var loginV: LoginV = {[weak self] in
        let Frame = CGRect(x: 0, y: 0, width: ScreenInfo.width, height: ScreenInfo.height)
        let loginV = LoginV(frame: Frame)
        loginV.loginVDelegate = self
        return loginV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.setupUI()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LoginVC:LoginVDelegate{
    func setupUI(){
        self.view.addSubview(loginV)
    }
    func toSuccess(loginV: LoginV) {
        let customTabBarV = CustomTabBarVC()
        customTabBarV.navigationItem.hidesBackButton=true
        self.navigationController?.navigationBar.isHidden = true
        //push方式
        self.navigationController?.pushViewController(customTabBarV , animated: true)
    }
}
