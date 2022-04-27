//
//  ColorExtend.swift
//  对color的扩展;支持16进制使用Color
//
//  Created by pc on 2022/4/27.
//

import Foundation
import UIKit

extension UIColor{
    //convenience：表示这是一个便利构造函数
    //是Swift语法，这里不讲解
    public convenience init(hex: Int){
        //self.init()
            
        //从Int中，通过与运算取出对应的颜色
        //最高2为表示红色
        //中间两位表示绿色
        //最低两位表示蓝色
        let red=(hex & 0xFF0000) >> 16
        let green=(hex & 0xFF00) >> 8
        let blue=(hex & 0xFF)
            
        //转为0~1区间
        let redFloat=Double(red)/255.0
        let greenFloat=Double(green)/255.0
        let blueFloat=Double(blue)/255.0
        
        //调用UIColor的初始方法
        self.init(red: CGFloat(redFloat), green: CGFloat(greenFloat), blue: CGFloat(blueFloat), alpha: 1)
    }
}
