//
//  ListResponse.swift
//  解析列表网络请求
//
//  Created by pc on 2022/6/7.
//

import Foundation
import HandyJSON

class ListResponse<T:HandyJSON>: BaseResponse {
    
    /// 定义一个列表
    /// 里面的对象使用了泛型
    var data:Array<T>?
    
}
