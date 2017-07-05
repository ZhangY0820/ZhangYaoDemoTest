//
//  PXProductDetailVideoTableViewCell.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/15.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXProductDetailVideoTableViewCell: UITableViewCell {
    var videoButton = UIButton()
    var titleLabel = UILabel()
    let spacing :CGFloat = 10.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        videoButton.setImage(UIImage(named:"placeHolderImage"), for: .normal)
        self.contentView.addSubview(videoButton)
        titleLabel.text = "顾问云-中国财富管理实务通讯.mp4"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        self.contentView.addSubview(titleLabel)
        videoButton.snp.makeConstraints { (make) in
            make.left.top.equalTo(spacing)
            make.size.equalTo(CGSize.init(width: 160, height: 80))
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(spacing)
            make.top.equalTo(videoButton.snp.bottom).offset(5)
            make.width.equalTo(videoButton)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
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
