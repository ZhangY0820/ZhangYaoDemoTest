//
//  PXProductDetailInfoTableViewCell.swift
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/16.
//  Copyright © 2017年 PX. All rights reserved.
//

import UIKit

class PXProductDetailInfoTableViewCell: UITableViewCell {
    var contentLabel = UILabel()
    
    let spacing: CGFloat = PXScreenAdapatation(value: 15)
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentLabel.font = PxFontAdapatation(fontSize: 15)
        contentLabel.numberOfLines = 0
        self.contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(spacing)
            make.bottom.right.equalTo(-spacing)
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
