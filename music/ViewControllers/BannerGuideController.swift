//
//  BannerGuideController.swift
//  扩展引导界面轮播图的数据源和代理
//
//  Created by pc on 2022/4/28.
//

import Foundation
import UIKit

//初始化轮播图组件
extension GuideViewController{
    /// 初始化轮播图组件
    func initBannerView() {
        // 这是轮播图的数据库为当前类
        bannerView.dataSource=self
        
        // 设置轮播图的代理为当前类
        bannerView.delegate=self
        
        // 设置如果显示的图片为空（找不到图片）显示的图片
        bannerView.emptyImage=UIImage (named: IMAGE_PLACE_HOLDER)
        
        // 设置占位图，就是图片还是下载下来前显示的图片
        bannerView.placeholderImage=UIImage (named: IMAGE_PLACE_HOLDER)
      
        // 设置轮播图组件内部显示图片调用什么方法
        // 下面这句话的意思是显示图片的时候
        // 调用：sd_setImageWithURL:placeholderImage:
        // 该方法是SDWebImage框架中的方法
        bannerView.bannerViewSelectorString="sd_setImageWithURL:placeholderImage:"

        
        //指示器默认颜色
        bannerView.pageControlNormalColor=UIColor(hex: COLOR_LIGHT_GREY)
        
        //高亮颜色
        bannerView.pageControlHighlightColor=UIColor(hex: COLOR_HIGHLIGHT)
        
        
        //指示器位置
        // self.bannerView.pageControlAliment = PageControlAlimentRight;
        
        //禁用自动滚动
        bannerView.autoScroll=false
        
        // 重新载入数据
        bannerView.reloadData()
    }
    
}

extension GuideViewController:YJBannerViewDelegate,YJBannerViewDataSource{
    /// banner数据来源
    ///
    /// - Parameter bannerView: 轮播组价
    /// - Returns: 返回要显示的图片
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        return ["Guide1","Guide2","Guide3","Guide4","Guide5"]
    }
    
    /// 自定义Cell
    /// 这里复写该方法的目的是，设置图片的缩放模式
    ///
    /// - Parameters:
    ///   - bannerView: bannerView description
    ///   - customCell: 原来的组件
    ///   - index: 当前索引
    /// - Returns: 返回新的cell
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        
        // 将cell转为YJBannerViewCell
        // 因为我们要给他配置一些属性
        let cell = customCell as! YJBannerViewCell
        
        cell.showImageViewContentMode=UIView.ContentMode.scaleToFill
        
        return cell
    }
    
    /// banner点击方法
    ///
    /// - Parameters:
    ///   - bannerView: bannerView description
    ///   - index: 点击的索引
    func bannerView(_ bannerView: YJBannerView!, didSelectItemAt index: Int) {
        print("GuideVC on bannerclick:\(index)")
    }
}
