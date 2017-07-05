//
//  PXProductListTableViewCell.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/14.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXProductListTableViewCell: UITableViewCell {

    var titleLabel :UILabel?
    var aprLabel :UILabel?
    var minMoneyAndTimeLimitLabel :UILabel?
    var backImage :UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.creatUI()
    }
    
    func creatUI() {
        let superView = self.contentView
        
        backImage = UIImageView()
        backImage?.backgroundColor = UIColor.red
        self.contentView.addSubview(backImage!)
        backImage?.snp.makeConstraints({ (make) in
            make.top.left.right.bottom.equalTo(superView)
        })
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor.white
        titleLabel?.font = PxFontAdapatation(fontSize: 20)
        backImage?.addSubview(titleLabel!)
        aprLabel = UILabel()
        aprLabel?.textColor = UIColor.lightGray
        aprLabel?.font = PxFontAdapatation(fontSize: 15)
        backImage?.addSubview(aprLabel!)
        minMoneyAndTimeLimitLabel = UILabel()
        minMoneyAndTimeLimitLabel?.textColor = UIColor.lightGray
        minMoneyAndTimeLimitLabel?.font = PxFontAdapatation(fontSize: 15)
        backImage?.addSubview(minMoneyAndTimeLimitLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo((backImage?.snp.left)!).offset(PXScreenAdapatation(value: 20))
            make.top.equalTo((backImage?.snp.centerY)!)
            make.right.equalTo(backImage!)
            make.height.equalTo(PXScreenAdapatation(value: 20))
            
        })
        aprLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo((backImage?.snp.left)!).offset(PXScreenAdapatation(value: 20))
            make.top.equalTo((titleLabel?.snp.bottom)!).offset(PXScreenAdapatation(value: 5))
            make.right.equalTo(backImage!)
            make.height.equalTo(PXScreenAdapatation(value: 20))
            
        })
        minMoneyAndTimeLimitLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo((backImage?.snp.left)!).offset(PXScreenAdapatation(value: 20))
            make.top.equalTo((aprLabel?.snp.bottom)!).offset(PXScreenAdapatation(value: 5))
            make.right.equalTo(backImage!)
            make.height.equalTo(PXScreenAdapatation(value: 20))
        })

        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
