//
//  MenuViewCell.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 13.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pushCountButton: UIButton!
    
    
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - Custom Functions
    func didSetup(fromItem item: SlideMenu.Item) {
        // Title
        self.title.text = item.title
        self.title.textAlignment = .left
        self.title.textColor = UIColor.init(hexString: (item.isColor!) ? "#f4d76c" : "#dedede", withAlpha: 1.0)
        
        // Icon
        self.iconView.image = UIImage.init(named: item.imageName)
        
        // New push count
        let pushCount = item.newPushCount
        
        if (pushCount != nil && pushCount! > 0) {
            self.pushCountButton.setTitle(String(pushCount!), for: .normal)
            self.pushCountButton.titleLabel?.textColor = UIColor.init(hexString: "#333333", withAlpha: 1.0)
            self.pushCountButton.isHidden = false
        } else {
            self.pushCountButton.isHidden = true
        }
    }
}
