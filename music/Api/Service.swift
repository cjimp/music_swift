//
//  Service.swift
//  music
//
//  Created by pc on 2022/5/30.
//

import Foundation
import Moya

// MARK: - 定义项目中所有接口
/// 定义项目中所有接口
///
/// - sheetDetail: 歌单详情
/// - sheets: 歌单列表
enum Service{
    case sheetDetail(id:String)
    case sheets
}

// MARK: - 实现TargetType协议
extension Service: TargetType {
    
    /// 返回网址URL
    var baseURL: URL {
        return URL(string: ENDPOINT)!
    }
    
    /// 返回每个请求的路径
    var path: String {
        switch self {
        case .sheets:
            return "/v1/sheets.json"
        case .sheetDetail(let id):
            return "/v1/sheets/\(id).json"
//        default:
//            return ""
        }
    }

    /// 返回每个请求的请求方式
    var method: Moya.Method {
        return .get
    }
    
    /// 这是测试相关的
    /// 这里用不到
    var sampleData: Data {
        return Data()
    }
    
    /// 返回每个请求的参数
    var task: Task {
        //不传递参数
        return .requestPlain
    }
    
    /// 请求头
    var headers: [String : String]? {
        return nil
    }
}
