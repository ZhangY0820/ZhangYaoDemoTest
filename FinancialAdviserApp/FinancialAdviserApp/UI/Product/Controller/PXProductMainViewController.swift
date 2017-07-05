//
//  PXProductMainViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/5.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXProductMainViewController: PXBaseViewController, UITableViewDelegate, UITableViewDataSource {
    var productTableView = UITableView()
    var productScrollView = UIScrollView()
    var selectBtn = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "产品"
        self.automaticallyAdjustsScrollViewInsets = false
        self.creatTableView()
        self.creatScrollView()
        // Do any additional setup after loading the view.
        
    }
    func creatScrollView() {
        productScrollView.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 60)
        productScrollView.backgroundColor = UIColor.white
        productScrollView.contentSize = CGSize(width: 810, height: 0)
        productScrollView.showsVerticalScrollIndicator = false
        productScrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(productScrollView)
        
        
        let titleArr = ["母基金类", "有限合伙类", "保险类", "海外投资类", "信托计划类", "p2p类", "阳光募捐类", "公募基金"]
        for i in 0..<titleArr.count {
            let btn = UIButton(type: .custom)
            btn.setTitle(titleArr[i], for: .normal)
            btn.titleLabel?.font = PxFontAdapatation(fontSize: 15)
            btn.frame = CGRect(x: i * 100 + 10, y: 15, width: 90, height: 30)
            btn.layer.cornerRadius = 15
            btn.titleLabel?.font = PxFontAdapatation(fontSize: 15)
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.layer.borderWidth = 0.5
            btn.layer.masksToBounds = true
            btn.tag = i
            btn.addTarget(self, action: #selector(clickSelect(sender:)), for: .touchUpInside)
            if i == 0 {
                btn.backgroundColor = RGB(r: 55, g: 130, b: 234, a: 1.0)
                btn.setTitleColor(UIColor.white, for: .normal)
                selectBtn = btn
            }else {

            btn.setTitleColor(UIColor.black, for: .normal)
            }
            productScrollView.addSubview(btn)
        }
    }
    
    func creatTableView() {
        productTableView = UITableView(frame: CGRect.init(x: 0, y: 124, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 172), style: .grouped)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.showsVerticalScrollIndicator = false
        self.view.addSubview(productTableView)
        productTableView.register(PXProductListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXProductListTableViewCell.self))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        }else {
            return PXScreenAdapatation(value: 15)
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXProductListTableViewCell.self)) as! PXProductListTableViewCell
        cell.backgroundColor = UIColor.green
        cell.titleLabel?.text = "GDFOF"
        cell.aprLabel?.text = "预期年化收益率6.8%~9.0%"
        cell.minMoneyAndTimeLimitLabel?.text = "起投金额：100万元 / 产品期限： 7+1+1+1年"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detailVC = PXProductDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func clickSelect(sender:UIButton) {
        print(sender.tag)
        if sender == selectBtn {
            
        }else {
            selectBtn.backgroundColor = UIColor.clear
            selectBtn.setTitleColor(UIColor.black, for: .normal)
            sender.backgroundColor = RGB(r: 55, g: 130, b: 234, a: 1.0)
            sender.setTitleColor(UIColor.white, for: .normal)
            selectBtn = sender
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
