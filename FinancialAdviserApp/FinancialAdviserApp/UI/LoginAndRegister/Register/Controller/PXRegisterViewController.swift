//
//  PXRegisterViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/7.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXRegisterViewController: PXBaseViewController, UITextFieldDelegate {
    private var _phoneNumberView = PXLabelAndTextFieldView()
    private var _codeNumberView = PXLabelAndTextFieldView()
    private var _passWordView = PXLabelAndTextFieldView()
    private var _againPasswordView = PXLabelAndTextFieldView()
    private var _registerBtn = UIButton()
    private var _registerProtocolBtn = UIButton()
    private var _selectBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "注册"
        getButtonItem(imageName: "back", viewController: self)
        self.creatUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(downKeyBoard))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    func downKeyBoard() {
        self.view.endEditing(true)
    }
    func creatUI()  {
        _codeNumberView.sendCodeBtn?.isHidden = false
        _codeNumberView.sendCodeBtn?.addTarget(self, action: #selector(sendCode), for: .touchUpInside)
        let viewArr = [_phoneNumberView, _codeNumberView, _passWordView, _againPasswordView]
        let labelTextArr = ["手机号", "验证码", "设置密码", "确认密码"]
        let textFieldPlaceholderArr = ["请填写手机号码", "请填写验证码", "请设置密码", "确认设置密码"]
        for i in 0..<viewArr.count {
            addLabelAndTextFieldView(mianView: viewArr[i], heightSize: CGFloat(i * 40), labelText: labelTextArr[i], textFieldPlaceholder: textFieldPlaceholderArr[i], viewController: self)
            viewArr[i].textField?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            viewArr[i].textField?.delegate = self
        }
        self.creatButton()
        
}
    func creatButton() {
        let superView = self.view
        
        _selectBtn = UIButton(type: .custom)
        _selectBtn.isSelected = true
        _selectBtn.setImage(UIImage(named:"protocolUnselect"), for: .normal)
        _selectBtn.setImage(UIImage(named:"protocolSelect"), for: .selected)
        _selectBtn.addTarget(self, action: #selector(selectStateClick), for: .touchUpInside)
        self.view.addSubview(_selectBtn)
        _selectBtn.snp.makeConstraints { (make) in
            make.left.equalTo((superView?.snp.left)!).offset(PXScreenAdapatation(value: 20))
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.top.equalTo((_againPasswordView.snp.bottom)).offset(PXScreenAdapatation(value: 20))
        }
        let textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.text = "已阅读并同意"
        textLabel.font = PxFontAdapatation(fontSize: 15)
        self.view.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.left.equalTo(_selectBtn.snp.right)
            make.size.equalTo(CGSize(width: PXScreenAdapatation(value: 100), height: 20))
            make.top.equalTo(_selectBtn)
        }
        _registerProtocolBtn = UIButton(type: .custom)
        _registerProtocolBtn.setTitle("《理财顾问注册服务协议》", for:.normal)
        _registerProtocolBtn.titleLabel?.font = PxFontAdapatation(fontSize: 15)
        _registerProtocolBtn.contentHorizontalAlignment = .left
        _registerProtocolBtn.setTitleColor(naviColor, for: .normal)
        _registerProtocolBtn.addTarget(self, action: #selector(registerProtocolClick), for: .touchUpInside)
        self.view.addSubview(_registerProtocolBtn)
        _registerProtocolBtn.snp.makeConstraints { (make) in
            make.left.equalTo(textLabel.snp.right)
            make.height.equalTo(_selectBtn)
            make.right.equalTo(superView!)
            make.top.equalTo(_selectBtn)
        }
        
        _registerBtn = UIButton(type: .custom)
        _registerBtn.isEnabled = false
        _registerBtn.setTitle("注册", for: .normal)
        _registerBtn.setTitleColor(RGB(r: 239, g: 239, b: 239, a: 0.5), for: .normal)
        _registerBtn.backgroundColor = RGB(r: 108, g: 151, b: 247, a: 0.9)
        _registerBtn.layer.cornerRadius = PXScreenAdapatation(value: 4)
        _registerBtn.layer.masksToBounds = true
        _registerBtn.addTarget(self, action: #selector(register), for: .touchUpInside)
        self.view.addSubview(_registerBtn)
        
        
        _registerBtn.snp.makeConstraints({ (make) in
            make.left.equalTo((superView?.snp.left)!).offset(PXScreenAdapatation(value: 20))
            make.height.equalTo(PXScreenAdapatation(value: 40))
            make.top.equalTo((_selectBtn.snp.bottom)).offset(PXScreenAdapatation(value: 30))
            make.right.equalTo((superView?.snp.right)!).offset(PXScreenAdapatation(value: -20))
        })
    }
    
    
    func textFieldDidChange() {
        if _selectBtn.isSelected {
            self.changeRegisterButton(state: stringIsNil(strArr:self.getStringArr()) )
        }else {
            self.changeRegisterButton(state: _selectBtn.isSelected)
        }
}
    func register()  {
            print("注册成功")
        }
    func selectStateClick() {
        _selectBtn.isSelected = !_selectBtn.isSelected
        if _selectBtn.isSelected {
        self.changeRegisterButton(state: stringIsNil(strArr:self.getStringArr()))
        }else {
         self.changeRegisterButton(state: _selectBtn.isSelected)
        }
}
    func getStringArr() -> [String] {
        let phoneNumberStr : String = (_phoneNumberView.textField?.text)!
        let codeNumberStr: String = (_codeNumberView.textField?.text)!
        let passWordStr : String = (_passWordView.textField?.text)!
        let againPasswordStr : String = (_againPasswordView.textField?.text)!
        let strArr = [phoneNumberStr, codeNumberStr, passWordStr, againPasswordStr]
        return strArr
    }
    func changeRegisterButton(state:Bool)  {
        _registerBtn.isEnabled = state
        if state {
            _registerBtn.setTitleColor(UIColor.white, for: .normal)
        }else {
            _registerBtn.setTitleColor(RGB(r: 239, g: 239, b: 239, a: 0.5), for: .normal)
        }
    }
    func registerProtocolClick() {
        let protocolVC = PXProtocolWebShowViewController()
        protocolVC.titleString = "注册协议"
        self.navigationController?.pushViewController(protocolVC, animated: true)
    }
    func sendCode() {
        print("发送验证码")
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
