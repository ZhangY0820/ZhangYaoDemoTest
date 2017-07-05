//
//  PXBaseViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/5.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = naviColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 17),NSForegroundColorAttributeName:UIColor.white]
        // Do any additional setup after loading the view.
    }

    func back() {
        self.navigationController?.popViewController(animated: true)
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
