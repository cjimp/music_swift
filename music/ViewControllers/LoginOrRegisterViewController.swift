//
//  LoginOrRegisterViewController.swift
//  登陆注册界面
//
//  Created by pc on 2022/4/27.
//

import UIKit

class LoginOrRegisterViewController: BaseViewController {

    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btRegister: UIButton!
    
    @IBAction func onClickQQLogin(_ sender: Any) {
        print("使用qq登录")
    }
    
    @IBAction func touchdown(_ sender: UIButton) {
        sender.backgroundColor = UIColor(hex: Color_Primary)
    }
    
    @IBAction func touchup(_ sender: UIButton) {
        sender.backgroundColor = UIColor.white
        
        //两个按钮关联到同一个方法
        if btLogin == sender{
            toLogin()
        }else{
            toRegister()
        }
    }
    @IBAction func touchupoutside(_ sender: UIButton) {
        sender.backgroundColor = UIColor.white
    }
    
    func toLogin(){
        print("login")
        //ToastUtil.short("test测试")
        ToastUtil.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
            ToastUtil.hideLoading()
        }
    }
    
    func toRegister(){
        print("to register")
        
        //实例化场景，因为场景有控制器
        //所以也可以说实例化控制器，但实例化是系统完成的
        //不是我们手动创建的
            
        //因为我们现在是在Controller中
        //所以就能访问到当前界面中的storyboard
        //就不用像前面那样在创建storyboard了
        let controller=storyboard!.instantiateViewController(withIdentifier: "Register")
       
        // 将控制器压入导航控制器
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func initViews() {
        //圆角
        ViewUtil.showLargeRadius(view: btLogin)
        ViewUtil.showLargeRadius(view: btRegister)
        //边框
        btLogin.showColorPrimaryBorder()
        btRegister.showColorPrimaryBorder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
