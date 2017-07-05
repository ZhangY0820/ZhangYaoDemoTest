//
//  PXFoundDetailViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/12.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXFoundDetailViewController: PXBaseViewController {
    var shareBtn = UIButton()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "资讯详情"
        getButtonItem(imageName: "back", viewController: self)
        self.creatShareBtn()
        // Do any additional setup after loading the view.
    }
    func creatShareBtn() {
        shareBtn = UIButton(type: .custom)
        shareBtn.backgroundColor = naviColor
        shareBtn.frame = CGRect(x: 0, y: SCREEN_HEIGHT - 50, width: SCREEN_WIDTH, height: 48)
        shareBtn.layer.cornerRadius = 6
        shareBtn.layer.masksToBounds = true
        shareBtn.setTitle("分享", for: .normal)
        shareBtn.addTarget(self, action: #selector(share), for: .touchUpInside)
        self.view.addSubview(shareBtn)
    }
    func share() {
        let alertController = UIAlertController(title: "", message: "分享功能待开发", preferredStyle: .alert)
        let shareAction = UIAlertAction(title: "OK", style: .default) { (shareAction) in
            print("分享")
        }
        alertController.addAction(shareAction)
        self.present(alertController, animated: true) {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
