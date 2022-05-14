//
//  TextFieldExtend.swift
//  扩展TextField
//
//  Created by pc on 2022/5/14.
//

import Foundation

extension UITextField{
    
    //显示左侧图标
    func showLeftIcon(name:String)  {
        //设置显示图片
        leftView = UIImageView(image: UIImage(named: name))
        //设置显示方法
        leftViewMode = UITextField.ViewMode.always
    }
}
