//
//  AddWordTableViewCell.swift
//  WordBank
//
//  Created by Jared Katzman on 5/11/15.
//  Copyright (c) 2015 deGatos. All rights reserved.
//

import UIKit

class AddWordTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var labelView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.textField.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == self.textField) {
            
            self.addButton.sendActionsForControlEvents(.TouchUpInside)
            textField.resignFirstResponder()
            return false
        }
        return true
    }
    
    func wordAdded (sender : UIButton!) {
        let word = textField.text
        
        println(word)
        
        if word != "" {
            let defaults = NSUserDefaults.standardUserDefaults()
            if var wordList = defaults.stringArrayForKey("wordList") {
                wordList.append(word)
                defaults.setObject(wordList, forKey: "wordList")
            }
        }
        
        textField.text = ""
        
        println("here1")
    }

}
