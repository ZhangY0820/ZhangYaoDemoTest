//
//  PXImageAndLabelButton.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/19.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXImageAndLabelButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 设置视图
    private func setupUI(){
        // 设置tilte
        titleLabel?.textAlignment = .center
        titleLabel?.font = PxFontAdapatation(fontSize: 13)
        setTitleColor(UIColor.darkGray, for: .normal)
        setTitleColor(naviColor, for: .selected)
    }
    
    // 对其子控件重新布局
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置imageView
        imageView?.frame = CGRect(x: self.frame.size.width / 3, y: self.frame.size.height / 5, width: self.frame.size.width / 3, height: self.frame.size.width / 3)
        // 设置title
        titleLabel?.frame = CGRect(x:0 , y: (3 * self.frame.size.width / 5), width: self.frame.width, height: self.frame.size.height / 4)
    }
    

}
