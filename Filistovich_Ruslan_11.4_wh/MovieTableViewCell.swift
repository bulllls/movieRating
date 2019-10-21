//
//  MyTableViewCell.swift
//  Filistovich_Ruslan_11.4_wh
//
//  Created by Ruslan on 10/10/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
