//
//  Constant.swift
//  常量类文件，主要用来保存项目中用到的字符串，颜色，尺寸，网络请求地址
//
//  Created by pc on 2022/4/25.
//

import Foundation

// MARK: 尺寸
/// 立即体验按钮宽度
let SIZE_BUTTON_ENTER_WIDTH = 130.0

/// 立即体验按钮高度
let SIZE_BUTTON_ENTER_HEIGHT = 44.0

/// 圆角角度
let SIZE_LARGE_RADIUS = 22

/// 边框
let SIZE_BORDER = 1

// MARK: 颜色
/// 全局主色调
let Color_Primary = 0xDD0000

/// 亮灰色
let COLOR_LIGHT_GREY=0xaaaaaa

/// 高亮颜色
let COLOR_HIGHLIGHT = 0xDD0000

///站位图
let IMAGE_PLACE_HOLDER = "PlaceHolder"

/// 手机号
/// 移动：134 135 136 137 138 139 147 150 151 152 157 158 159 178 182 183 184 187 188 198
/// 联通：130 131 132 145 155 156 166 171 175 176 185 186
/// 电信：133 149 153 173 177 180 181 189 199
/// 虚拟运营商: 170
let REGX_PHONE="^(0|86|17951)?(13[0-9]|15[012356789]|16[6]|19[89]]|17[01345678]|18[0-9]|14[579])[0-9]{8}$"

//邮箱正则表达式
let REGX_EMAIL="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
