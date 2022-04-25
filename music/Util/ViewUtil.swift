//
//  ViewUtil.swift
//  View相关的工具类，包括：圆角，边框
//
//  Created by pc on 2022/4/25.
//

import Foundation
import UIKit

class ViewUtil {
    
    /// 设置大圆角
    ///
    /// - Parameter view: 要设置的View
    static func showLargeRadius(view:UIView) {
        view.layer.cornerRadius = CGFloat(SIZE_LARGE_RADIUS)
        
        //裁剪多余的内容
        //例如：给ImageView设置了圆角
        //如果不裁剪多余的内容，就不会生效
        view.clipsToBounds=true
    }
}
