//
//  TodolistTableViewCell.swift
//  TodolistApp
//
//  Created by JillOU on 2020/8/19.
//  Copyright © 2020 Jillou. All rights reserved.
//

import UIKit

class TodolistTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
