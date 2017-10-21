//
//  UIFont+Extension.swift
//  Centers
//
//  Created by test on 2017/9/29.
//  Copyright © 2017年 com.youlu. All rights reserved.
//

import UIKit

extension UIFont{
    class func UiFontSize(size:CGFloat) -> UIFont {
        //Mark: ScreenInfo.height,手机屏幕的高度
        if  (UIScreen.main.bounds.height <= 568) {  // SE 4 5S
            return UIFont.systemFont(ofSize: size)//调整文字大小
        }else if ( UIScreen.main.bounds.height > 568 && UIScreen.main.bounds.height <= 667){  // 6 6S 7
            return UIFont.systemFont(ofSize: size)//调整文字大小
        }else{ //6plus 7plus
            return UIFont.systemFont(ofSize: size*1.15)//调整文字大小
        }
    }
    class func UiBoldFontSize(size:CGFloat) -> UIFont {
        //Mark: ScreenInfo.height,手机屏幕的高度
        if  (UIScreen.main.bounds.height <= 568) {  // SE 4 5S
            return UIFont.boldSystemFont(ofSize: size)//UIFont.systemFont(ofSize: size)//调整文字大小
        }else if ( UIScreen.main.bounds.height > 568 && UIScreen.main.bounds.height <= 667){  // 6 6S 7
            return UIFont.boldSystemFont(ofSize: size)//调整文字大小
        }else{ //6plus 7plus
            return UIFont.boldSystemFont(ofSize: size)//调整文字大小
        }
    }
    
}

func setHeight(size:CGFloat) -> CGFloat {
    //Mark: ScreenInfo.height,手机屏幕的高度
    if  (UIScreen.main.bounds.height <= 568) {  // SE 4 5S
        return size
    }else if ( UIScreen.main.bounds.height > 568 && UIScreen.main.bounds.height <= 667){  // 6 6S 7
        return size
    }else{ //6plus 7plus
        return size * UIScreen.main.bounds.height/568
    }
}

