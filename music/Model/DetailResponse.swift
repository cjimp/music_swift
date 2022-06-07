//
//  DetailResponse.swift
//  music
//
//  Created by pc on 2022/5/31.
//

import Foundation
import HandyJSON

/// 继承BaseResponse
/// 定义了一个泛型T
/// 泛型必须实现了HandyJSON协议
/// 希望用户传递的对象能解析为对象
/// 所以在这里必须要实现该协议
class DetailResponse<T:HandyJSON>: BaseResponse {
    
    /// 真实数据
    /// 他的类型是泛型
    /// 也就是说在使用的时候指定
    var data:T?
    
}
