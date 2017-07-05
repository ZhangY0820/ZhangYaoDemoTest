//
//  PXFoundMainViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/5.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXFoundMainViewController: PXBaseViewController, UITableViewDelegate, UITableViewDataSource  {
    var foundInfoBtn = UIButton()
    var foundResourceBtn = UIButton()
    var foundTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "发现"
        self.creatTwoBtn()
        self.creatTableView()
        
        // Do any additional setup after loading the view.
    }

    func creatTwoBtn() {
        let btnView = UIView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 50))
        self.view.addSubview(btnView)
        let midView = UIView()
        midView.backgroundColor = RGB(r: 239, g: 239, b: 239, a: 1.0)
        btnView.addSubview(midView)
        let bottomView = UIView()
        bottomView.backgroundColor = RGB(r: 239, g: 239, b: 239, a: 1.0)
        btnView.addSubview(bottomView)
        
        foundInfoBtn = UIButton(type: .custom)
        foundInfoBtn.setTitle("资讯", for: .normal)
        foundInfoBtn.isSelected = true
        foundInfoBtn.setTitleColor(naviColor, for: .selected)
        foundInfoBtn.setTitleColor(UIColor.black, for: .normal)
        btnView.addSubview(foundInfoBtn)
        foundInfoBtn.addTarget(self, action: #selector(infoGet(sender:)), for: .touchUpInside)
        foundInfoBtn.snp.makeConstraints({ (make) in
            make.top.left.equalTo(btnView)
            make.bottom.equalTo(bottomView.snp.top)
            make.right.equalTo(midView.snp.left)
        })
        foundResourceBtn = UIButton(type: .custom)
        foundResourceBtn.setTitle("资源", for: .normal)
        foundResourceBtn.isSelected = false
        foundResourceBtn.setTitleColor(naviColor, for: .selected)
        foundResourceBtn.setTitleColor(UIColor.black, for: .normal)
        btnView.addSubview(foundResourceBtn)
        foundResourceBtn.addTarget(self, action: #selector(infoGet(sender:)), for: .touchUpInside)
        foundResourceBtn.snp.makeConstraints({ (make) in
            make.top.right.equalTo(btnView)
            make.bottom.equalTo(bottomView.snp.top)
            make.left.equalTo(midView.snp.right)
        })
        midView.snp.makeConstraints { (make) in
            make.height.equalTo(btnView.bounds.size.height /  3)
            make.center.equalTo(btnView)
            make.width.equalTo(1)
        }
        bottomView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.bottom.equalTo(btnView.snp.bottom)
            make.left.width.equalTo(btnView)
        }
    }
    
    func infoGet(sender:UIButton) {
        if sender == foundInfoBtn {
            foundInfoBtn.isSelected = true
            foundResourceBtn.isSelected = false
        }else {
            foundResourceBtn.isSelected = true
            foundInfoBtn.isSelected = false
        }
        foundTableView.reloadData()
    }
    
    func creatTableView() {
        foundTableView = UITableView(frame: CGRect(x: 0, y: 114, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 162), style: .plain)
        foundTableView.delegate = self
        foundTableView.dataSource = self
        foundTableView.register(PXFoundInfoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXFoundInfoTableViewCell.self))
        foundTableView.register(PXFoundResourceTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXFoundResourceTableViewCell.self))
        self.view.addSubview(foundTableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (foundInfoBtn.isSelected) {
            let cell = foundTableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXFoundInfoTableViewCell.self)) as! PXFoundInfoTableViewCell
            cell.titleLabel?.text = "一份可操作的投资理财建议"
            cell.contentLabel?.text = "面对人口红利的消失和人民币汇率下行，中国投资者该如何捂好钱袋子"
            return cell
        }else {
            let cell = foundTableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXFoundResourceTableViewCell.self)) as!PXFoundResourceTableViewCell
            cell.titleLabel?.text = "全球投资财富生活"
            cell.timeLabel?.text = "活动时间：2017-01-19 00：00"
            cell.authorLabel?.text = "WOW宝贝"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PXScreenAdapatation(value: 120)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = PXFoundDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
        
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
