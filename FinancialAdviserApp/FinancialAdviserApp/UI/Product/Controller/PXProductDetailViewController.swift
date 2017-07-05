//
//  PXProductDetailViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/14.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit
import XLForm

class PXProductDetailViewController: PXBaseViewController, UITableViewDelegate, UITableViewDataSource {
    var marketCopyBtn = UIButton()//营销文案按钮
    var shareBtn = UIButton()//分享按钮
    var appointmentBtn = UIButton()//预约按钮
    var mainTableView = UITableView()
    let buttonHeight:CGFloat = PXScreenAdapatation(value: 50.0)//按钮高度
    var backImageView = UIImageView()//顶部背景图
    var infoBtn = UIButton()//基本信息按钮
    var accountBtn = UIButton()//募集账号按钮
    var announcementBtn = UIButton()//产品公告按钮
    var copyBtn = UIButton()//文本复制按钮
    var accountTitleArr = [String]()
    var accountContentArr = [String]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "产品详情"
        getButtonItem(imageName: "back", viewController: self)
        
        accountTitleArr = ["开户名", "募集银行", "募集账号", "打款备注"]
        accountContentArr = ["路过私募投资基金募集专户", "中国工商银行上海分行", "33344556789", "客户姓名+认购路过私募投资基金募集专户"]
        
        self.creatBottomThreeButton()
        self.creatTableView()
    }
    
    func creatTableView() {//tableView创建
        mainTableView = UITableView(frame: CGRect.init(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64 - buttonHeight), style: .grouped)
        mainTableView.estimatedRowHeight = 44
        mainTableView.rowHeight = UITableViewAutomaticDimension
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.showsVerticalScrollIndicator = false
        self.view.addSubview(mainTableView)
        mainTableView.register(PXProductListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXProductListTableViewCell.self))
        mainTableView.register(PXProductDetailAccountTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXProductDetailAccountTableViewCell.self))
        mainTableView.register(PXProductDetailVideoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXProductDetailVideoTableViewCell.self))
        mainTableView.register(PXProductDetailInfoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXProductDetailInfoTableViewCell.self))
        self.creatHeadView()
    }
    //tableView顶部视图添加
    func creatHeadView() {
        let headView = UIView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: PXScreenAdapatation(value: 250)))
        headView.backgroundColor = UIColor.white
        mainTableView.tableHeaderView = headView
        backImageView.image = UIImage(named: "placeHolderImage")
        backImageView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: PXScreenAdapatation(value: 200))
        headView.addSubview(backImageView)
        
        infoBtn = UIButton(type: .custom)
        accountBtn = UIButton(type: .custom)
        announcementBtn = UIButton(type: .custom)
        let buttonArr = [infoBtn, accountBtn, announcementBtn]
        let titleArr = ["基本信息", "募集账号", "产品公告"]
        for i in 0..<buttonArr.count {
            if i == 0 {
               buttonArr[i].isSelected = true
            }
            buttonArr[i].backgroundColor = RGB(r: 239, g: 239, b: 239, a: 1.0)
            buttonArr[i].setTitle(titleArr[i], for: .normal)
            buttonArr[i].titleLabel?.font = PxFontAdapatation(fontSize: 15)
            buttonArr[i].setTitleColor(naviColor, for: .selected)
            buttonArr[i].setTitleColor(UIColor.black, for: .normal)
            buttonArr[i].frame = CGRect(x: SCREEN_WIDTH / 3 * CGFloat(i), y: 200, width: SCREEN_WIDTH / 3, height: buttonHeight)
            buttonArr[i].tag = i
            buttonArr[i].addTarget(self, action: #selector(selectButtonClick(sender:)), for: .touchUpInside)
            headView.addSubview(buttonArr[i])
        }
        for i in 1...2 {
            let view = UIView(frame: CGRect.init(x: CGFloat(i) * SCREEN_WIDTH / 3, y: 215, width: 1, height: 20))
            view.backgroundColor = UIColor.lightGray
            headView.addSubview(view)
            
        }
        //tableView底部视图添加 默认是隐藏的
        let bottomView = UIView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: PXScreenAdapatation(value: 40)))
        copyBtn.frame = bottomView.frame
        copyBtn.backgroundColor = UIColor.white
        copyBtn.titleLabel?.font = PxFontAdapatation(fontSize: 13)
        copyBtn.setTitle("复制募集账号信息", for: .normal)
        copyBtn.setTitleColor(naviColor, for: .normal)
        copyBtn.addTarget(self, action: #selector(copyClick), for: .touchUpInside)
        bottomView.addSubview(copyBtn)
        mainTableView.tableFooterView = bottomView
        mainTableView.tableFooterView?.isHidden = true
        
    }
    
    func copyClick() {//文本赋值按钮点击事件
        let pastBoard = UIPasteboard.general
        pastBoard.string = "张垚复制银行文本"
        
    }
    //顶部三个按钮点击事件
    func selectButtonClick(sender:UIButton) {
            sender.isSelected = true
        if sender == infoBtn {
            accountBtn.isSelected = false
            announcementBtn.isSelected = false
            mainTableView.tableFooterView?.isHidden = true
        }
        if sender == accountBtn {
            infoBtn.isSelected = false
            announcementBtn.isSelected = false
            mainTableView.tableFooterView?.isHidden = false
        }
        if sender == announcementBtn {
            accountBtn.isSelected = false
            infoBtn.isSelected = false
            mainTableView.tableFooterView?.isHidden = true
        }
        mainTableView.reloadData()
    }
    //底部按钮创建
    func creatBottomThreeButton() {
        let view = UIView(frame: CGRect.init(x: 0, y: SCREEN_HEIGHT - buttonHeight - 0.5, width: SCREEN_WIDTH, height: 0.5))
        view.backgroundColor = RGB(r: 139, g: 139, b: 139, a: 1.0)
        self.view.addSubview(view)
        
        let textArr = ["营销文案", "分享", "预约"]
        marketCopyBtn = UIButton(type: .custom)
        shareBtn = UIButton(type: .custom)
        appointmentBtn = UIButton(type: .custom)
        let bottomButtonArr = [marketCopyBtn, shareBtn, appointmentBtn]
        for i in 0..<bottomButtonArr.count {
            bottomButtonArr[i].setTitle(textArr[i], for: .normal)
            bottomButtonArr[i].titleLabel?.font = PxFontAdapatation(fontSize: 13)
            if i == 2 {
                bottomButtonArr[i].backgroundColor = naviColor
                bottomButtonArr[i].setTitleColor(UIColor.white, for: .normal)
            }else {
                bottomButtonArr[i].setTitleColor(UIColor.black, for: .normal)
            }
            bottomButtonArr[i].frame = CGRect(x: SCREEN_WIDTH / 3 * CGFloat(i), y: SCREEN_HEIGHT - buttonHeight, width: SCREEN_WIDTH / 3, height: buttonHeight)
            bottomButtonArr[i].tag = i
            bottomButtonArr[i].addTarget(self, action: #selector(bottomButtonClick(sender:)), for: .touchUpInside)
            self.view.addSubview(bottomButtonArr[i])
        }
    }

    func bottomButtonClick(sender:UIButton) {
        switch sender.tag {
        case 0:
            let textViewVC = PXMarketCopyViewController()
            self.navigationController?.pushViewController(textViewVC, animated: true)
        case 1:
            print("分享")
        case 2:
            let appointVC = PXProductDetailAppointViewController()
            self.navigationController?.pushViewController(appointVC, animated: true)
            
        default:
            break
        }
    }
    
    //tableView代理协议
    func numberOfSections(in tableView: UITableView) -> Int {//分区数
        if infoBtn.isSelected {
            return 5
        }else if accountBtn.isSelected {
            return accountTitleArr.count
        }else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//行数
        if infoBtn.isSelected {
            if section == 1 || section == 2 {
                return 2
            }else {
                return 1
            }
        }else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//cell创建
        let videoCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXProductDetailVideoTableViewCell.self)) as! PXProductDetailVideoTableViewCell
        
        let accountCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXProductDetailAccountTableViewCell.self)) as! PXProductDetailAccountTableViewCell
        let infoCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXProductDetailInfoTableViewCell.self)) as! PXProductDetailInfoTableViewCell
        
        if infoBtn.isSelected {
            let normalCellID = "infoBtnCellID"
            var nolmalCell = tableView.dequeueReusableCell(withIdentifier: normalCellID)
            if nolmalCell == nil {
                nolmalCell = UITableViewCell(style: .value1, reuseIdentifier: normalCellID)
            }
            nolmalCell?.selectionStyle = .none
            
            let defaultCellID = "defaultCellID"
            var defaultCell = tableView.dequeueReusableCell(withIdentifier: defaultCellID)
            if defaultCell == nil {
                defaultCell = UITableViewCell(style: .default, reuseIdentifier: defaultCellID)
            }
            defaultCell?.selectionStyle = .none
            
            if indexPath.section == 0 {
                infoCell.contentLabel.text = "产品\n期限\n银行\n收益"
                return infoCell
            }else if indexPath.section == 1 {
                nolmalCell?.textLabel?.text = "产品佣金比例："
                nolmalCell?.textLabel?.textColor = UIColor.lightGray
                nolmalCell?.textLabel?.font = PxFontAdapatation(fontSize: 15)
                nolmalCell?.detailTextLabel?.text = "2%"
                nolmalCell?.detailTextLabel?.textColor = UIColor.lightGray
                nolmalCell?.detailTextLabel?.font = PxFontAdapatation(fontSize: 15)
                return nolmalCell!
            }else if indexPath.section == 2 {
                defaultCell?.textLabel?.text = "信息.pdf"
                defaultCell?.imageView?.image = UIImage(named: "testPDFImage")
                defaultCell?.accessoryType = .disclosureIndicator
                return defaultCell!
            }else if indexPath.section == 4 {
                infoCell.contentLabel.text = "产品\n\n\n\n期限\n银行\n收益"
                infoCell.backgroundColor = RGB(r: 248, g: 248, b: 248, a: 1.0)
                return infoCell
            }else {
                return videoCell
            }
        }else if accountBtn.isSelected {
            accountCell.titleLabel.text = accountTitleArr[indexPath.section]
            accountCell.contentLabel.text = accountContentArr[indexPath.section]
            return accountCell
        }else {
            let cellID = "cellID"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            cell?.selectionStyle = .none
            cell?.textLabel?.text = "公告.pdf"
            cell?.imageView?.image = UIImage(named: "testPDFImage")
            cell?.accessoryType = .disclosureIndicator
            return cell!
        }
    }
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if infoBtn.isSelected {
            if indexPath.section == 3 {
                return 160
            }else {
                return UITableViewAutomaticDimension
            }
        }else {
            return UITableViewAutomaticDimension
        }
    }
    //分区顶部视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    //分区底部视图高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if infoBtn.isSelected {
            if section == 3 || section == 4{
               return CGFloat.leastNormalMagnitude
            }else {
               return 15
            }
        }else {
            return CGFloat.leastNormalMagnitude
        }
    }
    //分区底部视图颜色
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = RGB(r: 248, g: 248, b: 248, a: 1.0)
        return view
        
    }
    //cell选中点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if infoBtn.isSelected{
            if indexPath.section == 2 {
               self.goToCheckPDF(title: "信息.pdf")
            }
        }
        if announcementBtn.isSelected {
            self.goToCheckPDF(title: "公告.pdf")
        }
    }
    //PDF文件查看 -- cell点击
    func goToCheckPDF(title:String) {
        let PDFViewController = PXPDFTextShowViewController()
        PDFViewController.titleSting = title
        self.navigationController?.pushViewController(PDFViewController, animated: true)
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
