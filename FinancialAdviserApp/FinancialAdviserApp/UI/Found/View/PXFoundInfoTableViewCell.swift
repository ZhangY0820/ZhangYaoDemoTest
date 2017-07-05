//
//  PXFoundInfoTableViewCell.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/12.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit


class PXFoundInfoTableViewCell: UITableViewCell {
    var mainImage :UIImageView?
    var titleLabel :UILabel?
    var contentLabel :UILabel?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.creatUI()
    }
    
    func creatUI() {
        let superView = self.contentView
        
        self.mainImage = UIImageView()
        self.contentView.addSubview(mainImage!)
        self.mainImage?.backgroundColor = UIColor.red
        self.titleLabel = UILabel()
        self.titleLabel?.font = UIFont.systemFont(ofSize: PXScreenAdapatation(value: 17), weight: PXScreenAdapatation(value: 17))
        self.contentView.addSubview(titleLabel!)
        self.contentLabel = UILabel()
        self.contentLabel?.numberOfLines = 0
        self.contentLabel?.textColor = UIColor.lightGray
        self.contentLabel?.font = PxFontAdapatation(fontSize: 15)
        self.contentView.addSubview(self.contentLabel!)
        
        self.mainImage?.snp.makeConstraints({ (make) in
            make.left.equalTo(superView.snp.left).offset(PXScreenAdapatation(value: 20))
           make.top.equalTo(superView.snp.top).offset(PXScreenAdapatation(value: 20))
            make.bottom.equalTo(superView.snp.bottom).offset(PXScreenAdapatation(value: -20))
            make.width.equalTo((self.mainImage?.snp.height)!)
        })
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo((self.mainImage?.snp.right)!).offset(PXScreenAdapatation(value: 5))
            make.top.equalTo((self.mainImage?.snp.top)!)
            make.right.equalTo(superView)
            make.height.equalTo(PXScreenAdapatation(value: 20))
        })
        self.contentLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo((self.mainImage?.snp.right)!).offset(PXScreenAdapatation(value: 5))
            make.top.equalTo((self.titleLabel?.snp.bottom)!).offset(PXScreenAdapatation(value: 5))
            make.right.equalTo(superView.snp.right).offset(PXScreenAdapatation(value: -20))
            make.bottom.equalTo((self.mainImage?.snp.bottom)!)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
