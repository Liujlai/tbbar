//
//  MineV.swift
//  Centers
//
//  Created by test on 2017/9/30.
//  Copyright © 2017年 com.youlu. All rights reserved.
//
import UIKit
protocol MineVDelegate: class {
    //导航栏左侧按钮点击区域
    func toMessage(mineV : MineV)
    //导航栏右侧按钮点击区域
    func toSetting(mineV : MineV)
    //跳转Sub
    func toSub(mineV : MineV)
}
class MineV: UIView {
    weak var mineVDelegate : MineVDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MineV:UITextFieldDelegate{
    func setupUI(){
        
        //自定义状态栏
        let statusView = UIView()
        statusView.backgroundColor = UIColor(patternImage: UIImage(named:"nav_f2471e.png")!)
        self.addSubview(statusView)
        statusView.snp.makeConstraints{ (make) in
            //make.centerY.equalTo(topPic)
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(ScreenInfo.width)
            make.height.equalTo(20)
        }
        //导航栏左侧按钮点击区域
        let leftView = UIView()
        leftView.isUserInteractionEnabled = true
        let infoGes = UITapGestureRecognizer(target: self, action: #selector(self.message(_:)))
        leftView.addGestureRecognizer(infoGes)
        self.addSubview(leftView)
        leftView.snp.makeConstraints{ (make) in
            make.top.equalTo(20)
            make.left.equalTo(15)
            make.width.equalTo(60)
            make.height.equalTo(44)
        }
        
        //导航栏右侧按钮点击区域
        let rightView = UIView()
        rightView.isUserInteractionEnabled = true
        let rGes = UITapGestureRecognizer(target: self, action: #selector(self.setting(_:)))
        rightView.addGestureRecognizer(rGes)
        self.addSubview(rightView)
        rightView.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.right.equalTo(-15)
            make.width.equalTo(60)
            make.height.equalTo(44)
        }
        
        let firstBtn = UIButton()
        firstBtn.frame = CGRect(x: 100, y: 100, width: ScreenInfo.width/3, height: 40)
        firstBtn.backgroundColor = UIColor.red
        firstBtn.setTitle("点击测试", for: .normal)
        firstBtn.addTarget(self, action:#selector(self.message(_:)), for:.touchUpInside)
        firstBtn.titleLabel?.textColor = UIColor.white
        self.addSubview(firstBtn)
        
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
        self.addSubview(btnSub);
        btnSub.snp.makeConstraints{ (make) in
            make.top.equalTo((ScreenInfo.height - setHeight(size: 30) - 108)/2)
            make.left.equalTo(0)
            make.width.equalTo(ScreenInfo.width)
            make.height.equalTo(setHeight(size: 30))
        }
    }
}
extension MineV{
    @objc func subJump(_ tapGes :UITapGestureRecognizer){
        mineVDelegate?.toSub(mineV : self)
    }
    @objc func message(_ tapGes :UITapGestureRecognizer){
        mineVDelegate?.toMessage(mineV : self)
    }
    @objc func setting(_ tapGes :UITapGestureRecognizer){
        mineVDelegate?.toSetting(mineV : self)
    }
}
