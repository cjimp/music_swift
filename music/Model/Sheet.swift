//
//  Sheet.swift
//  歌单模型
//
//  Created by pc on 2022/5/30.
//

import Foundation
import HandyJSON

class Sheet:HandyJSON {
    /// id
    var id: String!

    /// 标题
    var title:String!
    
    /// 封面
    var banner:String?
    
    /// 描述
    var description:String?
    
    /// 点击数
    var clicks_count:Int=0
    
    /// 收藏数
    var collections_count:Int=0
    
    /// 评论数
    var comments_count:Int=0
    
    /// 音乐数
    var songs_count:Int=0
    
    required init(){
        
    }
}
