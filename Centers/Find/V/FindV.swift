//
//  FindV.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit
protocol FindVDelegate: class {
    //跳转Tab
    func toTab(findV : FindV)
    //跳转Sub
    func toSub(findV : FindV)
}
class FindV: UIView {
    weak var findVDelegate : FindVDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FindV:UITextFieldDelegate{
    func setupUI(){
        //短信验证码登录
        let btnSub = UILabel()
        btnSub.text = "跳入子页面"
        btnSub.textColor = UIColor.colorWithCustom(242,g:72,b:28)
        btnSub.font=UIFont.UiBoldFontSize(size: 18)
        btnSub.textAlignment = .center
        //将label用户交互设为true
        btnSub.isUserInteractionEnabled = true
        let subGes = UITapGestureRecognizer(target: self, action: #selector(self.subJump(_:)))
        btnSub.addGestureRecognizer(subGes)
        addSubview(btnSub);
        btnSub.snp.makeConstraints { (make) in
            make.top.equalTo((ScreenInfo.height - setHeight(size: 30))/2)
            make.left.equalTo(0)
            make.width.equalTo(ScreenInfo.width/2)
            make.height.equalTo(setHeight(size: 30))
        }
        
        
        let btnTab = UILabel()
        btnTab.text = "跳入Tab页"
        btnTab.textColor = UIColor.colorWithCustom(242,g:72,b:28)
        btnTab.font=UIFont.UiBoldFontSize(size: 18)
        btnTab.textAlignment = .center
        //将label用户交互设为true
        btnTab.isUserInteractionEnabled = true
        let tabGes = UITapGestureRecognizer(target: self, action: #selector(self.tabJump(_:)))
        btnTab.addGestureRecognizer(tabGes)
        addSubview(btnTab);
        btnTab.snp.makeConstraints { (make) in
            make.top.equalTo((ScreenInfo.height - setHeight(size: 30))/2)
            make.left.equalTo(btnSub.snp.right).offset(0)
            make.width.equalTo(ScreenInfo.width/2)
            make.height.equalTo(setHeight(size: 30))
        }
    }
}
extension FindV{
    @objc func subJump(_ tapGes :UITapGestureRecognizer){
        findVDelegate?.toSub(findV : self)
    }
    @objc func tabJump(_ tapGes :UITapGestureRecognizer){
        findVDelegate?.toTab(findV : self)
    }
}
