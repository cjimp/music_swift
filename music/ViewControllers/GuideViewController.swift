//
//  GuideViewController.swift
//  music
//
//  Created by pc on 2022/4/25.
//

import UIKit

class GuideViewController: UIViewController{
    
    
    
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
        //不再播放轮播图
        setShowGuide()
        // 调用它里面的方法显示登录/注册界面
        AppDelegate.shared.toLoginOrRegister()
    }
    
    /// 立即体验按钮点击
    ///
    /// - Parameter sender: sender description
    @IBAction func onEnterClick(_ sender: Any) {
//        PreferenceUtil.setShowGuide(isShowGuide: true)
         setShowGuide()
        // 调用它里面的方法显示主界面
        //AppDelegate.shared.toHome()
    }
    
    func setShowGuide(){
        PreferenceUtil.setShowGuide(isShowGuide: true)
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
