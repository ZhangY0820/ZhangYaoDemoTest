//
//  PXProductDetailAppointViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/19.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXProductDetailAppointViewController: XLFormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "预约"
        self.getButtonItem(imageName: "back")
        self.initializeForm()
        // Do any additional setup after loading the view.
    }
    func initializeForm() {
        var form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "表单") as XLFormDescriptor
        section = XLFormSectionDescriptor.formSection(withTitle: "EOEOF") as XLFormSectionDescriptor
        form.addFormSection(section)
        
        // Date
        row = XLFormRowDescriptor(tag: "1", rowType: XLFormRowDescriptorTypeInfo, title:"真实姓名")
        //row.value = NSDate()
        row.cellConfig.setObject(UIColor.lightGray, forKey: "textLabel.textColor" as NSCopying)
        section.addFormRow(row)
        
        // Time
//        row = XLFormRowDescriptor(tag: "2", rowType: XLFormRowDescriptorTypeTextView, title: "备注")
        //row.value = NSDate()
        //section.addFormRow(row)
        
        // DateTime
//        row = XLFormRowDescriptor(tag: "3", rowType: XLFormRowDescriptorTypeDateTime, title: "预购日期")
//        //row.value = NSDate()
//        section.addFormRow(row)
        
        self.form = form;
        
        
        // Implementation details covered in the next section.
    }
//    required init!(coder aDecoder: NSCoder!) {
//        super.init(coder: aDecoder)
//        initializeForm()
//    }
    

    
    //自定义导航栏左侧按钮
    func getButtonItem(imageName:String) {
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = barButtonItem
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
