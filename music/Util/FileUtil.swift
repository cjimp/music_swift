//
//  FileUtil.swift
//  文件相关工具类
//
//  Created by pc on 2022/5/28.
//

import Foundation

class FileUtil {
    static func formatFileSize(_ data:Int) -> String {
        if data>0 {
            let size=Double(data)
            
            let kiloByte=size/1024
            if kiloByte<1 && kiloByte>0 {
                return String(format: "%.2fByte", size)
            }
            
            let megaByte=kiloByte/1024
            if megaByte<1 {
                return String(format: "%.2fK", kiloByte)
            }
            
            let gigaByte=megaByte/1024
            if gigaByte<1 {
                return String(format: "%.2fM", megaByte)
            }
            
            let teraByte=gigaByte/1024
            if teraByte<1 {
                return String(format: "%.2fG", gigaByte)
            }
            
            
            return String(format: "%.2fT", teraByte)
        }
        
        return "0K"
    }
}
