//
//  SplashViewController.swift
//  music
//
//  Created by pc on 2022/4/25.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 延时3秒钟
            // 时间大家可以根据业务需求调整
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.next()
            }
    }
    
    func next() {
        print("SplashController next")
        
        // 获取到当前应用的AppDelegate对象
        // 全局只有一个
        
        // 这里会报错找不到AppDelegate，是正常现象
        // 可能是Xcode Bug，但可以正常运行
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        
        // 调用它里面的方法显示引导界面
        appDelegate.toGuide()

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
