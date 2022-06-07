//
//  ObservableExtend.swift
//  扩展observable
//
//  Created by pc on 2022/5/31.
//

import Foundation
import RxSwift
import HandyJSON
import Moya

//自定义错误
public enum CJGError:Swift.Error{
    case objectMapping
}

//MARK: -扩展observable
extension Observable{
    /// 将字符串转为对象
    ///
    /// - Parameter type: 要转为的类
    /// - Returns: 转换完成的对象
    public func mapObject<T: HandyJSON>(_ type: T.Type) -> Observable<T>{
           
        return self.map { data in
        //将输入参数转为字符串
        let dataString=data as! String
            
            guard let result = type.deserialize(from: dataString) else {
                   //转为对象失败
                   //抛出错误
                throw CJGError.objectMapping
            }
            
            //返回解析后的对象
            return result
        }
    }

}

// MARK: - 扩展ObservableType
extension ObservableType {
  
    /// 观察成功和失败事件
    ///
    /// - Parameters:
    ///   - onSuccess: 请求正确回调
    ///   - onError: 出错了回调
    /// - Returns: <#return value description#>
    func subscribe(_ onSuccess: @escaping ((E) -> Void),_ onError: @escaping ((BaseResponse?,Error?) -> Bool))
        -> Disposable {
            
    }

    /// <#Description#>
    ///
    /// - Parameter onSuccess: 请求正确回调
    /// - Returns: <#return value description#>
    func subscribeOnSuccess(_ onSuccess: @escaping ((E) -> Void))
        -> Disposable {
            
    }
}
