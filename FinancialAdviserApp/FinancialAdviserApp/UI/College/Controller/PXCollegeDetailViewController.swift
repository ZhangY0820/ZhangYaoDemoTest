//
//  PXCollegeDetailViewController.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/20.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PXCollegeDetailViewController: PXBaseViewController, UITableViewDelegate, UITableViewDataSource {
    var backButton = UIButton()
    var titleLabel = UILabel()
    var tableView = UITableView()
    var topView = UIView()
    var bottomView = UIView()
    var backView = UIView()
    var playOrPauseBtn = UIButton()
    var leftTimeLabel = UILabel()
    var slider = UISlider()
    var rightTimeLabel = UILabel()
    var fullScreenBtn = UIButton()
    var platers = AVPlayerLayer()
    var item : AVPlayerItem!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatUI()
        self.creatTableView()
        // Do any additional setup after loading the view.
    }
    
    func creatTopView() {
        
    }
    //MARK:播放视图创建
    func creatUI() {
        //backView.backgroundColor = UIColor.blue
        backView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 300)
//        backView.backgroundColor = UIColor.black
//        backView.alpha = 0.3
        self.view.addSubview(backView)
        
//        backView.snp.makeConstraints { (make) in
//            make.top.left.right.equalTo(0)
//            make.height.equalTo(300)
//        }
        
        item = AVPlayerItem(url: NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")! as URL)
        item.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions.new, context: nil)
        let play = AVPlayer(playerItem: item)
        platers = AVPlayerLayer(player: play)
        platers.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 300)
        self.backView.layer.addSublayer(platers)
        platers.videoGravity = AVLayerVideoGravityResizeAspect
        play.play()
        self.creatBottomView()
        
        
        
//        let player = AVPlayer(url: NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")! as URL)
//        let playerController = AVPlayerViewController()
//        playerController.player = player
//        self.addChildViewController(playerController)
//        self.view.addSubview(playerController.view)
//        playerController.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: PXScreenAdapatation(value: 300))
//        player.play()
//        
        
        backButton.setImage(UIImage.init(named: "college_back"), for: .normal)
        backButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        backButton.frame = CGRect(x: PXScreenAdapatation(value: 15), y: PXScreenAdapatation(value: 40), width: PXScreenAdapatation(value: 30), height: PXScreenAdapatation(value: 20))
        self.view.addSubview(backButton)
//        titleLabel.textColor = UIColor.white
//        titleLabel.font = PxFontAdapatation(fontSize: 13)
//        titleLabel.frame = CGRect(x: PXScreenAdapatation(value: 50), y: PXScreenAdapatation(value: 40), width: SCREEN_WIDTH - PXScreenAdapatation(value: 50), height: PXScreenAdapatation(value: 20))
//        titleLabel.text = "图片上传测试"
//        self.view.addSubview(titleLabel)
    }
    
    func creatBottomView() {
        bottomView.backgroundColor = UIColor.black
//        bottomView.frame = CGRect(x: 0, y: 0, width: backView.bounds.size.width, height: 40)
        backView.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-20)
            make.height.equalTo(40)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            if item.status == AVPlayerItemStatus.readyToPlay {
                print("可以播放")
            }
        }
    }
    
    
    func buttonClick() {
        UIView.animate(withDuration: 0.2) { 
           self.backView.transform = self.backView.transform.rotated(by: CGFloat(Double.pi/2))
            self.backView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            self.platers.frame = CGRect.init(x: 0, y: 0, width: SCREEN_HEIGHT, height: SCREEN_WIDTH)
//            self.bottomView.snp.makeConstraints({ (make) in
//                make.left.right
//            })
            UIApplication.shared.keyWindow?.addSubview(self.backView)
        }
        
        //self.back()
        
    }
    //MARK:tableView创建
    func creatTableView() {
        tableView = UITableView(frame: CGRect.init(x: 0, y: 300, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 300), style: .plain)
        tableView.backgroundColor = tableViewSectionColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        self.view.addSubview(tableView)
        let headView = UIView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: PXScreenAdapatation(value: 10)))
        headView.backgroundColor = tableViewSectionColor
        tableView.tableHeaderView = headView
        
        tableView.register(PXCollegeDetailLikeTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXCollegeDetailLikeTableViewCell.self))
        tableView.register(PXProductDetailInfoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PXProductDetailInfoTableViewCell.self))
    }
    //MARK:tableView代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let likeCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXCollegeDetailLikeTableViewCell.self)) as! PXCollegeDetailLikeTableViewCell
        likeCell.titleLabel.text = "产品后台培训"
        likeCell.numberLabel.text = "999"
        likeCell.likeBtn.addTarget(self, action: #selector(likeClick(button:)), for: .touchUpInside)
        let infoCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PXProductDetailInfoTableViewCell.self)) as! PXProductDetailInfoTableViewCell
        infoCell.contentLabel.text = "主讲人：技能培训经理\n主讲人介绍：牛投邦技能培训经理介绍"
        if indexPath.row == 0 {
            return likeCell
        }else {
            return infoCell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 44
        }else {
            return UITableViewAutomaticDimension
        }
    }
    
    func likeClick(button:UIButton) {
        button.setImage(UIImage.init(named: "college_likeSelect"), for: .normal)
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
