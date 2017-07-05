//
//  PXLoginViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/5.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXLoginViewController: PXBaseViewController, UITextFieldDelegate {
    private var _phoneNumberView = PXLabelAndTextFieldView()
    private var _passWordView = PXLabelAndTextFieldView()
    private var _loginBtn = UIButton()
    private var _registerBtn = UIButton()
    private var _forgetPassWordBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        self.creatUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(downKeyBoard))
        self.view.addGestureRecognizer(tap)

    }
    func downKeyBoard() {
            self.view.endEditing(true)
    }
    func creatUI()  {
        let viewArr = [_phoneNumberView, _passWordView]
        let labelTextArr = ["手机号码", "密码"]
        let textFieldPlaceholderArr = ["请填写手机号码", "请填写登录密码"]
        for i in 0..<2 {
            addLabelAndTextFieldView(mianView: viewArr[i], heightSize: CGFloat(i * 40), labelText: labelTextArr[i], textFieldPlaceholder: textFieldPlaceholderArr[i], viewController: self)
            viewArr[i].textField?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            viewArr[i].textField?.delegate = self
        }
        self.threeButtonCreat()
    }
    func threeButtonCreat()  {
        let superView = self.view
        //登录按钮创建、属性设置
        _loginBtn = UIButton(type: .custom)
        _loginBtn.isEnabled = false
        _loginBtn.setTitle("登录", for: .normal)
        _loginBtn.backgroundColor = naviColor
        _loginBtn.setTitleColor(RGB(r: 239, g: 239, b: 239, a: 0.5), for: .normal)
        _loginBtn.layer.cornerRadius = PXScreenAdapatation(value: 4)
        _loginBtn.layer.masksToBounds = true
        _loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.view.addSubview(_loginBtn)
        
        //登录按钮布局
        _loginBtn.snp.makeConstraints({ (make) in
            make.left.equalTo((superView?.snp.left)!).offset(PXScreenAdapatation(value: 20))
            make.height.equalTo(PXScreenAdapatation(value: 40))
            make.top.equalTo((_passWordView.snp.bottom)).offset(PXScreenAdapatation(value: 30))
            make.right.equalTo((superView?.snp.right)!).offset(PXScreenAdapatation(value: -20))
        })
        //注册按钮创建、属性设置
        _registerBtn = UIButton(type: .custom)
        _registerBtn.setTitle("立即注册", for: .normal)
        _registerBtn.setTitleColor(naviColor, for: .normal)
        _registerBtn.titleLabel?.font = PxFontAdapatation(fontSize: 13)
        _registerBtn.contentHorizontalAlignment = .left
        _registerBtn.addTarget(self, action: #selector(register), for: .touchUpInside)
        self.view.addSubview(_registerBtn)
        //注册按钮布局
        _registerBtn.snp.makeConstraints { (make) in
            make.left.equalTo(_loginBtn)
            make.top.equalTo(_loginBtn.snp.bottom).offset(PXScreenAdapatation(value: 10))
            make.height.equalTo(PXScreenAdapatation(value: 20))
            make.right.equalTo((superView?.snp.centerX)!)
        }
        //忘记密码按钮创建、属性设置
        _forgetPassWordBtn = UIButton(type: .custom)
        _forgetPassWordBtn.setTitle("忘记密码？", for: .normal)
        _forgetPassWordBtn.setTitleColor(naviColor, for: .normal)
        _forgetPassWordBtn.titleLabel?.font = PxFontAdapatation(fontSize: 13)
        _forgetPassWordBtn.contentHorizontalAlignment = .right
        _forgetPassWordBtn.addTarget(self, action: #selector(forgetPassword), for: .touchUpInside)
        self.view.addSubview(_forgetPassWordBtn)
        //忘记按钮布局
        _forgetPassWordBtn.snp.makeConstraints { (make) in
            make.right.equalTo(_loginBtn)
            make.top.equalTo(_loginBtn.snp.bottom).offset(PXScreenAdapatation(value: 10))
            make.height.equalTo(PXScreenAdapatation(value: 20))
            make.left.equalTo((superView?.snp.centerX)!)
        }
    }
    func textFieldDidChange() {
        self.changeLoginButtonState(state: stringIsNil(strArr:self.getStringArr()))
    }
    func changeLoginButtonState(state:Bool)  {
        _loginBtn.isEnabled = state
        if state {
            _loginBtn.setTitleColor(UIColor.white, for: .normal)
        }else {
            _loginBtn.setTitleColor(RGB(r: 239, g: 239, b: 239, a: 0.5), for: .normal)
        }
    }
    func getStringArr() -> [String] {
        let phoneNumberStr : String = (_phoneNumberView.textField?.text)!
        let passWordStr : String = (_passWordView.textField?.text)!
        let stringArr = [phoneNumberStr, passWordStr]
        return stringArr
    }
    
    func login()  {//登录点击事件
        let realNameVC = PXRealNameViewController()
        self.navigationController?.pushViewController(realNameVC, animated: true)
        
    }
    
    func register() {//立即注册点击事件
        let registerVC = PXRegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    func forgetPassword() {//忘记密码点击事件
        let forgetPasswordVC = PXForgetPasswordViewController()
        self.navigationController?.pushViewController(forgetPasswordVC, animated: true)
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
