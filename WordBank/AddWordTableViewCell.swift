//
//  AddWordTableViewCell.swift
//  WordBank
//
//  Created by Jared Katzman on 5/11/15.
//  Copyright (c) 2015 deGatos. All rights reserved.
//

import UIKit

class AddWordTableViewCell: UITableViewCell {

    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var labelView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
