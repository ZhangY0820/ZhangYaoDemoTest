//
//  PXCollegeListTableViewCell.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/20.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXCollegeListTableViewCell: UITableViewCell {
    var mainImageView = UIImageView()
    var midImageView = UIImageView()
    var titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        mainImageView.image = UIImage(named: "placeHolderImage")
        mainImageView.isUserInteractionEnabled = true
        self.contentView.addSubview(mainImageView)
        midImageView.image = UIImage.init(named: "college_playerButton")
        self.contentView.addSubview(midImageView)
        titleLabel.textColor = UIColor.white
        titleLabel.font = PxFontAdapatation(fontSize: 13)
        self.contentView.addSubview(titleLabel)
        mainImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(0)
            
        }
        midImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: PXScreenAdapatation(value: 40), height: PXScreenAdapatation(value: 40)))
            make.center.equalTo(self.contentView)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(PXScreenAdapatation(value: 20))
            make.bottom.equalTo(-PXScreenAdapatation(value: 15))
            make.height.equalTo(PXScreenAdapatation(value: 20))
            make.right.equalTo(0)
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
