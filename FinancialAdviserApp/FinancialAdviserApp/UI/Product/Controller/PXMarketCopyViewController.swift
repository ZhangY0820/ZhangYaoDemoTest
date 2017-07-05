//
//  PXMarketCopyViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/16.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit
import MessageUI

class PXMarketCopyViewController: PXBaseViewController, UITextViewDelegate, MFMessageComposeViewControllerDelegate {
    var textView = UITextView()
    var bottomView = UIView()
    
    let spacing : CGFloat = PXScreenAdapatation(value: 10.0)//view间距
    let buttonSpacing : CGFloat = PXScreenAdapatation(value: 35.0)//按钮间距
    let buttonHeight :CGFloat = PXScreenAdapatation(value: 60.0)//按钮高度
    let bottomViewHeight :CGFloat = PXScreenAdapatation(value: 120.0)//底部视图高度
    let inputViewHeight :CGFloat = PXScreenAdapatation(value: 44.0)//键盘附属视图高度
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "营销文案"
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = RGB(r: 245, g: 249, b: 249, a: 1.0)
        
        getButtonItem(imageName: "back", viewController: self)
        
        self.creatTextView()
        self.creatBottomView()
        //键盘通知注册
        NotificationCenter.default.addObserver(self, selector: #selector(keyboordWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboordWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // Do any additional setup after loading the view.
    }
   
    func creatTextView() {
        textView.font = PxFontAdapatation(fontSize: 15)
        textView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        textView.delegate = self
        textView.backgroundColor = UIColor.white
        textView.textColor = UIColor.black
        textView.keyboardType = .default
        textView.text = "恒宇天泽于2015年3月获得由中国证券投资基金业协会颁发的私募投资基金管理人登记证书，成为开展私募证券投资、股权投资、创业投资等私募基金业务的金融机构。恒宇天泽专注于高端客户财富管理，固定收益类和浮动收益类阳光私募产品发行规模320亿，管理规模突破200亿，经验丰富。自成立以来，恒宇天泽在资产管理方面积累了相当成熟的经验，本基金融合了恒宇天泽的背景优势和专业的投资管理团队优势，拥有丰富的优质项目储备，为基金投资人创造优质的投资回报"
        self.view.addSubview(textView)
        textView.snp.makeConstraints({ (make) in
            make.left.equalTo(spacing)
            make.top.equalTo(64 + spacing)
            make.right.equalTo(-spacing)
            make.bottom.equalTo(-bottomViewHeight - 3 * spacing)
            
        })
        //键盘添加附属视图
        let toolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: inputViewHeight))
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: SCREEN_WIDTH - PXScreenAdapatation(value: 60), y: PXScreenAdapatation(value: 7), width: PXScreenAdapatation(value: 50), height: PXScreenAdapatation(value: 30))
        btn.setTitle("完成", for: .normal)
        btn.setTitleColor(naviColor, for: .normal)
        toolBar.addSubview(btn)
        toolBar.backgroundColor = RGB(r: 239, g: 239, b: 239, a: 1.0)
        btn.addTarget(self, action: #selector(done), for: .touchUpInside)
        textView.inputAccessoryView = toolBar
    }
    
    func done() {//点击附属视图的完成按钮--键盘回落
        
        self.view.endEditing(true)
    }
    //底部视图创建
    func creatBottomView() {
        bottomView.backgroundColor = UIColor.white
        self.view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(bottomViewHeight)
        }
        let buttonImageArr = [UIImage(named: "weChat"), UIImage(named: "weChatFriends"), UIImage(named: "message"), UIImage(named: "copy")]
        let labelTitleArr = ["微信", "朋友圈", "短信", "复制"]
        for i in 0..<labelTitleArr.count {
            let button = UIButton(type: .custom)
            button.tag = i
            button.frame = CGRect(x: PXScreenAdapatation(value: 20) + (buttonHeight + buttonSpacing) * CGFloat(i), y: PXScreenAdapatation(value: 20), width: buttonHeight, height: buttonHeight)
            button.setImage(buttonImageArr[i], for: .normal)
            button.layer.cornerRadius = PXScreenAdapatation(value: 30)
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
            bottomView.addSubview(button)
            let label = UILabel(frame: CGRect.init(x:PXScreenAdapatation(value: 20) + (buttonHeight + buttonSpacing) * CGFloat(i), y: PXScreenAdapatation(value: 85), width: buttonHeight, height: PXScreenAdapatation(value: 20)))
            label.text = labelTitleArr[i]
            label.textColor = UIColor.lightGray
            label.textAlignment = .center
            label.font = PxFontAdapatation(fontSize: 15)
            bottomView.addSubview(label)
        }
    }
    //底部按钮点击事件
    func buttonClick(button:UIButton) {
        switch button.tag {
        case 0:
           print("微信分享")
        case 1:
           print("朋友圈分享")
        case 2:
           self.messgeSend()
        case 3:
           self.copyClick()
        default:
            break
        }
    }
    //发送短信
    func messgeSend() {
        if MFMessageComposeViewController.canSendText() {
            let messageVC = MFMessageComposeViewController()
            messageVC.body = textView.text
            messageVC.messageComposeDelegate = self
            self.present(messageVC, animated: true, completion: {
                
            })
            
        }else {
            print("该设备不支持发短信功能")
        }
    }
    //发送短信代理协议
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
        switch result {
        case .cancelled:
            print("发送取消")
        case .sent:
            print("发送成功")
        case .failed:
            print("发送失败")
        }
    }
    //复制文本
    func copyClick() {
        let pastBoard = UIPasteboard.general
        pastBoard.string = textView.text
        
    }
    //textView代理协议
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    //键盘监听事件
    func keyboordWillShow(notification:NSNotification) {
        let userInfo = notification.userInfo
        let keyboardSize = (userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        print(keyboardSize.height)
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - keyboardSize.height - 64)
        }
    }
    
    func keyboordWillHide(notification:NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
