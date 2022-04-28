//
//  PreferenceUtil.swift
//  偏好设置工具类：是否登录，是否显示引导面，用户id
//
//  Created by pc on 2022/4/28.
//

import Foundation

class PreferenceUtil{
    // 是否显示引导界面常量字符串
    private static let KEY_GUIDE = "KEY_GUIDE"
        
        
        /// 判断是否要显示引导界面
        ///
        /// - Returns: return bool true：表示显示引导界面，false：表示不显示
        static func isShowGuide() -> Bool {
            // 获取KEY_GUIDE的值
            let isShowGuide=UserDefaults.standard.bool(forKey: PreferenceUtil.KEY_GUIDE)
            // 如果不等于true，表示显示引导界面

            if !isShowGuide {
                // 如果isShowGuide为nil，就是第一次运行
                // 所以返回true，表示要显示引导界面
                // 如果存储的是true，就不会来到这里
                return true
            }
            
            // 其他情况下，返回false
            return false
        }
        
        /// 设置显示了引导界面
        ///
        /// - Parameter isShowGuide: 是否显示了引导界面
        static func setShowGuide(isShowGuide:Bool) {
            //保存值
            UserDefaults.standard.set(isShowGuide, forKey: KEY_GUIDE)
        }
}
