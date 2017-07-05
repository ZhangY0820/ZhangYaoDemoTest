//
//  PXColorManager.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/5.
//  Copyright © 2017年 PX. All rights reserved.
//

import Foundation
import UIKit

//颜色
func RGB(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(colorLiteralRed: Float(r) / 255.0, green: Float(g) / 255.0, blue: Float(b) / 255.0, alpha: Float(a) / 1.0)
}
//导航栏颜色
public let naviColor = RGB(r: 89, g: 147, b: 236, a: 1.0)
//文本公用颜色
public let textColor = RGB(r: 139, g: 139, b: 139, a: 1.0)
//间隔视图颜色
public let tableViewSectionColor = RGB(r: 239, g: 239, b: 239, a: 1.0)

