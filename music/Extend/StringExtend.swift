//
//  StringExtend.swift
//  扩展字符串
//
//  Created by pc on 2022/5/27.
//

import Foundation


extension String{
    /// 去除字符串收尾空格和换行
    ///
    /// - Returns: 去除后的字符串
    func trim() -> String? {
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        
        //通过这个方法去除字符串收尾空格和换行
        return self.trimmingCharacters(in: whitespace)
    }
    
    /// 是否符合昵称规范（2~10位）
    ///
    /// - Returns: true:表示符合规范；false:不符合
    func isNickname() -> Bool {
        if self.count>=2 && self.count<=10 {
            return true
        }
        
        return false
    }
    
    //是否符合手机号格式
    func isPhone() -> Bool {
        let predicate=NSPredicate(format: "SELF MATCHES %@", REGX_PHONE)
        return predicate.evaluate(with: self)
    }
    
    /// 是否符合邮箱格式
    ///
    /// - Returns: <#return value description#>
    func isEmail() -> Bool {
        let predicate=NSPredicate(format: "SELF MATCHES %@", REGX_EMAIL)
        return predicate.evaluate(with: self)
    }


    /// 是否符合密码格式
    ///
    /// - Returns: <#return value description#>
    func isPassword() -> Bool {
        if self.count>=6 && self.count<=15 {
            return true
        }
        
        //TODO 真实项目中，可能还会判断密码强度
        
        return false
    }
}
