//
//  PostV.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//
import UIKit
import SnapKit
protocol PostVDelegate: class {
    //关闭本View
    func toClose(postV : PostV)
}
class PostV: UIView {
    weak var postVDelegate : PostVDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PostV:UITextFieldDelegate{
    func setupUI(){
        
        // 返回按钮
//        let btnClose = UIButton(type: .custom)
//        btnClose.setImage(UIImage(named:"btnClose.png"), for: .normal)
//        btnClose.addTarget(self, action: #selector(self.smsClick(_:)), for: .touchUpInside)
//        addSubview(btnClose);
//        btnClose.snp.makeConstraints { (make) in
//            make.top.equalTo(setHeight(size: 27))
//            make.left.equalTo(0)
//            make.width.equalTo(ScreenInfo.width/5)
//            make.height.equalTo(30)
//        }
//        
//        //短信验证码登录
//        let titleTag = UILabel()
//        titleTag.text = "短信验证码登录"
//        titleTag.textColor = UIColor.colorWithCustom(242,g:72,b:28)
//        titleTag.font=UIFont.UiBoldFontSize(size: 18)
//        titleTag.textAlignment = .center
////        //将label用户交互设为true
////        titleTag.isUserInteractionEnabled = true
////        let smsGes = UITapGestureRecognizer(target: self, action: #selector())
////        titleTag.addGestureRecognizer(smsGes)
//        addSubview(titleTag);
//        titleTag.snp.makeConstraints { (make) in
//            make.top.equalTo(setHeight(size: 20))
//            make.left.equalTo(0)
//            make.width.equalTo(ScreenInfo.width)
//            make.height.equalTo(44)
//        }
    }
}
extension PostV{
    @objc func smsClick(_ :UIButton){
        postVDelegate?.toClose(postV : self)
    }
}
