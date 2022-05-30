//
//  ToashUtil.swift
//  提示，加载，等待工具类
//
//  Created by pc on 2022/5/14.
//

import UIKit
import MBProgressHUD

class ToastUtil{
    private static var hud:MBProgressHUD?
    
    //显示一个短时间（一秒钟）的提示
    static func short(_ message:String){
        //创建一个MBProgressHUD
        let hud = MBProgressHUD.showAdded(to: AppDelegate.shared.window!.rootViewController!.view, animated: true)
        //只显示文字
        hud.mode = .text
        //小矩形的背景颜色
        hud.bezelView.color = UIColor.black
        //设置显示的内容
        hud.detailsLabel.text = message
        //设置文本颜色
        hud.detailsLabel.textColor = UIColor.white
        //设置自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    static func showLoading(_ message:String){
        hud=MBProgressHUD.showAdded(to:AppDelegate.shared.window!.rootViewController!.view, animated: true)
           
        //设置菊花颜色
        hud!.activityIndicatorColor=UIColor.white
           
        //设置背景模糊
        hud!.backgroundView.style = MBProgressHUDBackgroundStyle.solidColor
           
        //设置背景为半透明效果
        //UIColor(white：0.0：表示黑色
        //0.1表示黑色有透明效果；0表示完全透明；1表示完全黑色
        hud!.backgroundView.color=UIColor(white: 0.0, alpha: 0.1)
        
        //小矩形的背景色
        hud!.bezelView.color = UIColor.black
        
        //细节文字
        hud!.detailsLabel.text = message
        
        //细节文字颜色
        hud!.detailsLabel.textColor=UIColor.white
        
        //显示
        hud!.show(animated: true)
        
    }
       
    /// 显示一个加载对话框，使用默认文字
    static func showLoading() {
        showLoading("拼命加载中.")
    }
       
    /// 隐藏加载对话框
    static func hideLoading() {
        if hud != nil {
            hud!.hide(animated: true)
            hud=nil
        }
    }
}
