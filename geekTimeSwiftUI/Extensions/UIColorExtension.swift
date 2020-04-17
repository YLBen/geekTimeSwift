//
//  UIColorExtension.swift
//  geekTimeSwiftUI
//
//  Created by Ben Lv on 2020/1/25.
//  Copyright © 2020 ruibo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func hexColor (_ hexValue: Int, alphaValue: Float) -> UIColor {
        return UIColor(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    static func hexColor (_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, alphaValue: 1)
    }
    
    
    //便捷初始化方法
    /*
         convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
         便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
         便利构造函数的特点：
         1、便利构造函数通常都是写在extension里面
         2、便利函数init前面需要加载convenience
         3、在便利构造函数中需要明确的调用self.init()
        
         */
    convenience init(_ hexValue: Int, alphaValue: Float) {
         self.init(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    convenience init(_ hexValue: Int) {
        self.init(hexValue, alphaValue: 1)
    }
    
    //通过颜色来得到一张图片
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

