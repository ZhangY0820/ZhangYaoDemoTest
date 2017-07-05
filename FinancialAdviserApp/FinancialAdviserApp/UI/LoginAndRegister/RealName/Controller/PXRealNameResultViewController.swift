//
//  PXRealNameResultViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/8.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXRealNameResultViewController: PXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "审核结果"
        getButtonItem(imageName: "back", viewController: self)
        let barButtonItem = UIBarButtonItem(title: "刷新", style: .done, target: self, action: #selector(refresh))
        barButtonItem.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = barButtonItem
        // Do any additional setup after loading the view.
    }

    func refresh() {
        print("刷新结果")
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
