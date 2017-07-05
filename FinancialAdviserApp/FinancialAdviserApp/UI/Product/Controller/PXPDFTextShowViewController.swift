//
//  PXPDFTextShowViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/16.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXPDFTextShowViewController: PXBaseViewController {
    var titleSting :String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getButtonItem(imageName: "back", viewController: self)
        self.title = titleSting
        // Do any additional setup after loading the view.
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
