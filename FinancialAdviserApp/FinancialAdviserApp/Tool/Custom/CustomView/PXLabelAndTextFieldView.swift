//
//  PXLabelAndTextFieldView.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/6.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit
//import SnapKit

class PXLabelAndTextFieldView: UIView {
    var label :UILabel?
    var textField :UITextField?
    var sendCodeBtn : UIButton?
    
    var bottomView : UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel()
        label?.textColor = textColor
        label?.font = PxFontAdapatation(fontSize: 17)
        label?.sizeToFit()
        self.addSubview(label!)
        textField = UITextField()
        textField?.font = PxFontAdapatation(fontSize: 17)
        textField?.contentVerticalAlignment = .center
        textField?.clearButtonMode = .whileEditing
        self.addSubview(textField!)
        sendCodeBtn = UIButton(type: .custom)
        sendCodeBtn?.setTitle("发送验证码", for: .normal)
        sendCodeBtn?.titleLabel?.font = PxFontAdapatation(fontSize: 17)
        sendCodeBtn?.contentHorizontalAlignment = .right
        sendCodeBtn?.setTitleColor(naviColor, for: .normal)
        sendCodeBtn?.isHidden = true
        self.addSubview(sendCodeBtn!)
        bottomView = UIView()
        bottomView?.backgroundColor = RGB(r: 220, g: 220, b: 220, a: 1.0)
        self.addSubview(bottomView!)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let superView = self
        
        label!.snp.makeConstraints { (make) in
            make.left.equalTo(PXScreenAdapatation(value: 20))
            make.centerY.equalTo(superView)
            make.width.equalTo(PXScreenAdapatation(value: 90))
            make.height.equalTo(PXScreenAdapatation(value: 30))
        }
        if (sendCodeBtn?.isHidden)! {
            textField!.snp.makeConstraints { (make) in
                make.left.equalTo((label?.snp.right)!).offset(PXScreenAdapatation(value: 5))
                make.centerY.equalTo(label!)
                make.height.equalTo(label!)
                make.right.equalTo(superView.snp.right).offset(PXScreenAdapatation(value: -20))
            }
        }else {
            textField!.snp.makeConstraints { (make) in
                make.left.equalTo((label?.snp.right)!).offset(PXScreenAdapatation(value: 5))
                make.centerY.equalTo(label!)
                make.height.equalTo(label!)
                make.right.equalTo((sendCodeBtn?.snp.left)!)
            }
            sendCodeBtn!.snp.makeConstraints { (make) in
                make.width.equalTo(PXScreenAdapatation(value: 100))
                make.centerY.equalTo(label!)
                make.height.equalTo(label!)
                make.right.equalTo(superView).offset(PXScreenAdapatation(value: -20))
            }
        }
        bottomView!.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(superView)
            make.left.equalTo(label!)
            make.height.equalTo(PXScreenAdapatation(value: 1))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
