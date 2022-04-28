//
//  GuideViewController.swift
//  music
//
//  Created by pc on 2022/4/25.
//

import UIKit

class GuideViewController: UIViewController,YJBannerViewDataSource,YJBannerViewDelegate{
    
    
    
    // MARK: 字段
    //轮播图组件
    @IBOutlet weak var bannerView: YJBannerView!
    
    //登陆注册按钮
    @IBOutlet weak var btLoginOrRegister: UIButton!
    //用户体验按钮
    @IBOutlet weak var btEnter: UIButton!
    //底部容器
    @IBOutlet weak var vwfootcontainer: UIView!
    
    
    // MARK: 事件
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初始化轮播图组件
        // 之所有放到单独的方法中
        // 是因为可能以后会添加更多的初始代码
        // 放一个方法中，当前方法就会显得比较臃肿
        initBannerView()
    }
    
    
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
    
    
    
    /// 当前布局完成后
    override func viewDidLayoutSubviews() {
        // 获取当前view的frame
        // 也就是当前view的，x,y，width,height
        let contentFrame=view.frame
        
        //按钮垂直位置,y
        let buttonY=(vwfootcontainer.frame.size.height-SIZE_BUTTON_ENTER_HEIGHT)/2

        //登录注册按钮，x
        let btLoginOrRegisterX=(contentFrame.size.width-(SIZE_BUTTON_ENTER_WIDTH*2))/3
        
        // 设置登录/注册按钮位置和大小
        btLoginOrRegister.frame=CGRect(x: btLoginOrRegisterX, y: buttonY, width: SIZE_BUTTON_ENTER_WIDTH, height: SIZE_BUTTON_ENTER_HEIGHT)

        // //立即体验按钮，x
        let btEnterX=btLoginOrRegisterX*2+SIZE_BUTTON_ENTER_WIDTH
        
        // 设置立即体验按钮位置和大小
        btEnter.frame=CGRect(x: btEnterX, y: buttonY, width: SIZE_BUTTON_ENTER_WIDTH, height: SIZE_BUTTON_ENTER_HEIGHT)

//        //登录/注册按钮圆角20
//        self.btLoginOrRegister.layer.cornerRadius = SIZE_BUTTON_ENTER_HEIGHT/2
//
//        //立即体验按钮圆角20
//        btEnter.layer.cornerRadius = SIZE_BUTTON_ENTER_HEIGHT/2
        
        ViewUtil.showLargeRadius(view: btLoginOrRegister)
        
        ViewUtil.showLargeRadius(view: btEnter)
        
//        // 边框为1
        btEnter.layer.borderWidth = 1
        
        
//        // 边框颜色
//        // 参数为：rgb
//        // 透明度：0：完全透明，1:完全不透明
//        // 取值都是0~1，所以要除以255.0
//        btEnter.layer.borderColor=UIColor(red: 212/255.0, green: 0, blue: 0, alpha: 1.0).cgColor
//        btEnter.showColorPrimaryBorder()
//        btEnter.layer.borderColor=UIColor(hex: Color_Primary).cgColor
        btEnter.layer.borderColor=UIColor(named: "ColorPrimary")?.cgColor
}

    /// 登录或注册按钮点击
    ///
    /// - Parameter sender: sender description
    @IBAction func onLoginOrRegisterClick(_ sender: Any) {
        // 调用它里面的方法显示登录/注册界面
        AppDelegate.shared.toLoginOrRegister()
    }
    
    /// 立即体验按钮点击
    ///
    /// - Parameter sender: sender description
    @IBAction func onEnterClick(_ sender: Any) {
        // 调用它里面的方法显示主界面
        AppDelegate.shared.toHome()
    }
    
    /// banner数据来源
    ///
    /// - Parameter bannerView: 轮播组价
    /// - Returns: 返回要显示的图片
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        return ["Cjglogo","Cjglogo","Cjglogo","Cjglogo","Cjglogo"]
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
        
        cell.showImageViewContentMode=UIView.ContentMode.scaleAspectFit
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
