//
//  UIButton+Extension.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit
private var key: Void?
public extension UIButton {
    //未UIbutton添加一个存储属性，便于传参
    var strBtn: String? {
        get {
            return objc_getAssociatedObject(self, &key) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
