//
//  ViewExtend.swift
//  对UIview的扩展类，扩展设置边框的办法
//
//  Created by pc on 2022/4/25.
//

import Foundation
import UIKit

// MARK: 这里是用了swift的扩展语法
extension UIView{
    func showColorPrimaryBorder(){
        //边框为1
        self.layer.borderWidth = CGFloat(SIZE_BORDER)
        
        //边框颜色
        self.layer.borderColor = UIColor(red: 212/255, green: 0, blue: 0, alpha: 1.0).cgColor
    }
}
