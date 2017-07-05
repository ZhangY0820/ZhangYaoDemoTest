//
//  PXSizeManager.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/6.
//  Copyright © 2017年 PX. All rights reserved.
//

import Foundation
import UIKit

//屏幕宽、高
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
//屏幕尺寸适配
func PXScreenAdapatation(value:CGFloat) -> CGFloat {
    return (value / 375.0 * SCREEN_WIDTH)
}
//屏幕字体适配
func PxFontAdapatation(fontSize:CGFloat) -> UIFont {
    let font = UIFont.systemFont(ofSize: PXScreenAdapatation(value: fontSize))
    return font
    
}
