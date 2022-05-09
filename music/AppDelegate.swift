//
//  AppDelegate.swift
//  music
//
//  Created by pc on 2022/4/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    // 定义一个静态的计算属性
    // 返回AppDelegate 对象实例
    open class var shared: AppDelegate{
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
   
    func setRootViewControll(name:String){
        //获取到Main.storyboard
        let mainStory=UIStoryboard(name: "Main", bundle: nil)
        
        //实例化Guide场景，因为场景有控制器
        //所以也可以说实例化控制器
        //但实例化过程是系统完成的
        let controller=mainStory.instantiateViewController(withIdentifier: name)
        
        //这里替换到原来的根控制器
        //目的是，不希望用户还能返回到给界面
        self.window!.rootViewController = controller
    }

    
    func toGuide() {
      setRootViewControll(name: "Guide")
    }

    /// 跳转到登录/注册页面
    func toLoginOrRegister() {
       setRootViewControll(name: "LoginOrRegisterNavigation")
        
    }
    
    /// 跳转到首页
    func toHome() {
        setRootViewControll(name: "Home")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

