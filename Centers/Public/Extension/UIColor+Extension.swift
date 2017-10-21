//
//  UIColor+Extension.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit

extension UIColor{
    
    //    扩充构造函数，必须扩充便利构造函数，明确的调用 self.init（）
    convenience init(r:CGFloat,g: CGFloat,b:CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    class func colorWithCustom(_ r: CGFloat, g:CGFloat, b:CGFloat,alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    /// RGB颜色
    ///
    /// - Parameters:
    ///   - r: red  0-255
    ///   - g: green 0-255
    ///   - b: blue 0-255
    /// - Returns: UIColor
    class func RGB (_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return self.RGBA(r, g, b, 1)
    }
    
    class func RGBA (_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}
