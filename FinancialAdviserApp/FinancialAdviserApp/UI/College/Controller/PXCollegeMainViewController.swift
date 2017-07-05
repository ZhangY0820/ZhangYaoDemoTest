//
//  PXCollegeMainViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/5.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXCollegeMainViewController: PXBaseViewController, UITableViewDelegate, UITableViewDataSource {
    var topView = UIView()
    var selectButton = UIButton()
    var mainTableView = UITableView()
    let topViewHeight : CGFloat = PXScreenAdapatation(value: 80)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.title = "学院"
        self.creatTopView()
        self.creatTableView()
        // Do any additional setup after loading the view.
    }
    //MARK:创建tableView
    func creatTableView() {
        mainTableView = UITableView(frame: CGRect.init(x: 0, y: 64 + topViewHeight, width: SCREEN_WIDTH, height: SCREEN_HEIGHT -  112 - topViewHeight), style: .plain)
        mainTableView.delegate = self;
        mainTableView.dataSource = self
        mainTableView.tableFooterView = UIView()
        self.view.addSubview(mainTableView)
        mainTableView.register(PXCollegeListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXCollegeListTableViewCell.self))
    }
    //MARK:tableView代理方法
    //分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PXScreenAdapatation(value: 150)
    }
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXCollegeListTableViewCell.self)) as! PXCollegeListTableViewCell
        cell.titleLabel.text = "金融机构功能与监管"
        return cell
    }
    //分区头视图背景色
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = tableViewSectionColor
        return view
        
    }
    //分区头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return PXScreenAdapatation(value: 10)
    }
    //分区尾部高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = PXCollegeDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //MARK:顶部视图创建
    //顶部视图创建
    func creatTopView() {
        
        topView.backgroundColor = UIColor.white
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(64)
            make.height.equalTo(topViewHeight)
        }
        let buttonImageArr = [UIImage(named: "college_select"), UIImage(named: "college_productTraning"), UIImage(named: "college_skillTraning"), UIImage(named: "college_finacial")]
        let buttonTitleArr = ["精选", "产品培训", "技能培训", "金融知识"]
        for i in 0..<buttonTitleArr.count {
            let button = PXImageAndLabelButton(type: .custom)
            if i == 0 {
                button.isSelected = true
                selectButton = button
            }
            button.setTitle(buttonTitleArr[i], for: .normal)
            button.tag = i
            button.frame = CGRect(x:SCREEN_WIDTH / 4 * CGFloat(i), y: 0, width: SCREEN_WIDTH / 4, height: topViewHeight)
            button.setImage(buttonImageArr[i], for: .normal)
            button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
            topView.addSubview(button)
        }
    }
    //MARK:顶部按钮点击事件
    func buttonClick(button:UIButton) {
        if button != selectButton {
            selectButton.isSelected = false
            button.isSelected = true
            selectButton = button
        }
        switch button.tag {
        case 0:
            print("精选")
        case 1:
            print("产品培训")
        case 2:
            print("技能培训")
        case 3:
            print("金融知识")
        default:
            break
        }
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
