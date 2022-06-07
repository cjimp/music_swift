//
//  Api.swift
//  网络请求包装类
//  向外部提供一个与框架无关的接口
//
//  Created by pc on 2022/6/7.
//

import Foundation
import RxSwift
import HandyJSON
import Moya

class Api {
    /// 单例设计模式
    static let shared = Api()
    
    /// MoyaProvider
    private let provider:MoyaProvider<Service>!
    
    /// 私有构造方法
    private init() {
        //初始化MoyaProvider
        provider = MoyaProvider<Service>()
        
    }
    
    /// 歌单列表
    ///
    /// - Returns: return value description
    func sheets() -> Observable<ListResponse<Sheet>>{
        return provider
        .rx
        .request(.sheets)
        .filterSuccessfulStatusCodes()
        .asObservable()
        .mapString()
        .mapObject(ListResponse<Sheet>.self)
    }
    
    /// 歌单详情
    ///
    /// - Returns: return value description
    func sheetDetail(id:String) -> Observable<DetailResponse<Sheet>>{
        return provider
            .rx
            .request(.sheetDetail(id: id))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(DetailResponse<Sheet>.self)
    }
}
