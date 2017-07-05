//
//  PXRealNameViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/8.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXRealNameViewController: PXBaseViewController, UITextFieldDelegate {

    private var _phoneNumberView = PXLabelAndTextFieldView()
    private var _passWordView = PXLabelAndTextFieldView()
    private var _nextBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "实名认证"
        getButtonItem(imageName: "back", viewController: self)
        self.creatUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(downKeyBoard))
        self.view.addGestureRecognizer(tap)
        
    }
    func downKeyBoard() {
        self.view.endEditing(true)
    }
    func creatUI()  {
        let viewArr = [_phoneNumberView, _passWordView]
        let labelTextArr = ["姓名", "身份证号"]
        let textFieldPlaceholderArr = ["请输入真实姓名", "请输入身份证号"]
        for i in 0..<2 {
            addLabelAndTextFieldView(mianView: viewArr[i], heightSize: CGFloat(i * 40), labelText: labelTextArr[i], textFieldPlaceholder: textFieldPlaceholderArr[i], viewController: self)
            viewArr[i].textField?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            viewArr[i].textField?.delegate = self
        }
        self.threeButtonCreat()
    }
    func threeButtonCreat()  {
        let superView = self.view
        //按钮创建、属性设置
        _nextBtn = UIButton(type: .custom)
        _nextBtn.isEnabled = false
        _nextBtn.setTitle("确定", for: .normal)
        _nextBtn.backgroundColor = naviColor
        _nextBtn.setTitleColor(RGB(r: 239, g: 239, b: 239, a: 0.5), for: .normal)
        _nextBtn.layer.cornerRadius = PXScreenAdapatation(value: 4)
        _nextBtn.layer.masksToBounds = true
        _nextBtn.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
        self.view.addSubview(_nextBtn)
        
        //按钮布局
        _nextBtn.snp.makeConstraints({ (make) in
            make.left.equalTo((superView?.snp.left)!).offset(PXScreenAdapatation(value: 20))
            make.height.equalTo(PXScreenAdapatation(value: 40))
            make.top.equalTo((_passWordView.snp.bottom)).offset(PXScreenAdapatation(value: 30))
            make.right.equalTo((superView?.snp.right)!).offset(PXScreenAdapatation(value: -20))
        })
    }
    func textFieldDidChange() {
        self.changeNextButtonState(state: stringIsNil(strArr:self.getStringArr()))
    }
    func changeNextButtonState(state:Bool)  {
        _nextBtn.isEnabled = state
        if state {
            _nextBtn.setTitleColor(UIColor.white, for: .normal)
        }else {
            _nextBtn.setTitleColor(RGB(r: 239, g: 239, b: 239, a: 0.5), for: .normal)
        }
    }
    func getStringArr() -> [String] {
        let phoneNumberStr : String = (_phoneNumberView.textField?.text)!
        let passWordStr : String = (_passWordView.textField?.text)!
        let stringArr = [phoneNumberStr, passWordStr]
        return stringArr
    }
    
    func nextStep()  {//点击事件
        let resultVC = PXRealNameResultViewController()
        self.navigationController?.pushViewController(resultVC, animated: true)
        
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
