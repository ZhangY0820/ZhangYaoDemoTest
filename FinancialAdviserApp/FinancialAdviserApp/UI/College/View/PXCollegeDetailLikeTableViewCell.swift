//
//  PXCollegeDetailLikeTableViewCell.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/20.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXCollegeDetailLikeTableViewCell: UITableViewCell {
    var titleLabel = UILabel()
    var likeBtn = UIButton()
    var numberLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        titleLabel.font = PxFontAdapatation(fontSize: 15)
        self.contentView.addSubview(titleLabel)
        likeBtn.setImage(UIImage.init(named: "college_likeUnselect"), for: .normal)
        self.contentView.addSubview(likeBtn)
        numberLabel.font = PxFontAdapatation(fontSize: 11)
        self.contentView.addSubview(numberLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(PXScreenAdapatation(value: 15))
            make.top.height.equalTo(self.contentView)
            make.right.equalTo(likeBtn.snp.left)
        }
        likeBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 16, height: 16))
            make.right.equalTo(numberLabel.snp.left).offset(-5)
            make.centerY.equalTo(self.contentView)
        }
        numberLabel.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.right.equalTo(self.contentView).offset(-5)
            make.top.height.equalTo(self.contentView)
        }
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
