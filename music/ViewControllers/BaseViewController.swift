//
//  BaseViewController.swift
//  所有控制器通用父类
//
//  Created by pc on 2022/5/14.
//

import UIKit

class BaseViewController: UIViewController {
    
    func initViews(){
        
    }
    
    func initDatas(){
        
    }

    func initListeners(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViews()
        initDatas()
        initListeners()
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
