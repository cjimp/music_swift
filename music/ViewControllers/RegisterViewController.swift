//
//  RegisterViewController.swift
//  注册界面
//
//  Created by pc on 2022/5/9.
//

import UIKit
import RxSwift
import Moya
import HandyJSON

class RegisterViewController: BaseViewController {

    @IBOutlet weak var tfNickname: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    @IBOutlet weak var btRegister: UIButton!
    
    
    @IBAction func onClickRegister(_ sender: Any) {
        //昵称
        let nickname=tfNickname.text?.trim()!

        if nickname!.isEmpty {
            ToastUtil.short("请输入昵称！")
            return
        }

        guard nickname!.isNickname() else {
            ToastUtil.short("昵称长度不正确！")
            return
        }

        //手机号
        let phone=tfPhone.text!.trim()

        if phone!.isEmpty {
            ToastUtil.short("请输入手机号！")
            return
        }

        guard phone!.isPhone() else {
            ToastUtil.short("手机号格式不正确！")
            return
        }

        //邮箱
        let email=tfEmail.text!.trim()

        if email!.isEmpty {
            ToastUtil.short("请输入邮箱！")
            return
        }

        guard email!.isEmail() else {
            ToastUtil.short("邮箱格式不正确！")
            return
        }

        //密码
        let password=tfPassword.text!.trim()

        if password!.isEmpty{
            ToastUtil.short("请输入密码！")
            return
        }

        guard password!.isPassword() else {
            ToastUtil.short("密码格式不正确！")
            return
        }

        //确认密码
        let confirmPassword=tfConfirmPassword.text!.trim()

        if confirmPassword!.isEmpty{
            ToastUtil.short("请输入确认密码！")
            return
        }

        guard confirmPassword!.isPassword() else {
            ToastUtil.short("确认密码格式不正确！")
            return
        }

        //确认密码判断
        guard password==confirmPassword else {
            ToastUtil.short("两次密码不正确！")
            return
        }
    }
    
    @IBAction func onClickAgreement(_ sender: Any) {
        //请求歌单详情
        //用来测试网络请求框架
        let provider = MoyaProvider<Service>()
        provider
            .rx
            .request(.sheetDetail(id: "1"))
            .subscribe { event in
                //event类型为SingleEvent<Response>
                switch event {
                case let .success(response):
                    //请求成功
                    let data = response.data
                    let code = response.statusCode
                    
                    //将data转为String
                    //data的类型为Data
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    print("RegisterController request sheet detail succes:\(code),\(dataString)")
                    
                    //解析为对象
                    let sheetWrapper=SheetWrapper.deserialize(from: dataString)
                    
                    //解析完成后打印出歌单详情
                    print("RegisterController request sheet detail:\(sheetWrapper!.data!.title!)")
                case let .error(error):
                    //请求失败
                    print("RegisterController request sheet detail failed:\(error)")
                }
        }
    }
    
    
    override func initViews() {
        super.initViews()
        ViewUtil.showLargeRadius(view: btRegister)
        
        tfNickname.showLeftIcon(name: "LoginItemPhone")
        tfEmail.showLeftIcon(name: "LoginItemPhone")
        tfPhone.showLeftIcon(name: "LoginItemPhone")
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
