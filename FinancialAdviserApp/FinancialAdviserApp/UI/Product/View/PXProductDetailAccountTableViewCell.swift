//
//  PXProductDetailAccountTableViewCell.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/15.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXProductDetailAccountTableViewCell: UITableViewCell {
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    let spacing: CGFloat = PXScreenAdapatation(value: 10)
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(titleLabel)
        contentLabel.textColor = UIColor.lightGray
        contentLabel.numberOfLines = 0
        self.contentView.addSubview(contentLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(spacing)
            make.width.equalTo(SCREEN_WIDTH / 3 - 2 * spacing)
            make.bottom.equalTo(-spacing)
        }
        contentLabel.snp.makeConstraints { (make) in
            make.height.top.equalTo(self.contentView)
            make.left.equalTo(titleLabel.snp.right)
            make.right.equalTo(-spacing)
        }
        
        
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
