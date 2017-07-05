//
//  CommonMethods.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/7.
//  Copyright © 2017年 PX. All rights reserved.
//

import Foundation
import UIKit

//自定义导航栏左侧按钮
func getButtonItem(imageName:String, viewController:PXBaseViewController) {
    let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
    let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: viewController, action: #selector(viewController.back))
    viewController.navigationItem.leftBarButtonItem = barButtonItem
}

//注册、登录、忘记密码 添加视图
func addLabelAndTextFieldView(mianView:PXLabelAndTextFieldView, heightSize:CGFloat, labelText:String, textFieldPlaceholder:String, viewController:PXBaseViewController) {
    mianView.frame = CGRect(x: 0, y: 100 + PXScreenAdapatation(value: heightSize), width: SCREEN_WIDTH, height: PXScreenAdapatation(value: 40))
    mianView.label?.text = labelText
    mianView.textField?.placeholder = textFieldPlaceholder
    mianView.textField?.setValue(PxFontAdapatation(fontSize: 17), forKeyPath: "_placeholderLabel.font")
    viewController.view.addSubview(mianView)
}
//判断字符串是否为空 
func stringIsNil(strArr:[String]) -> Bool {
    for str in strArr {
        if str.characters.count == 0 {
            return false
        }
    }
    return true
}

