//
//  ViewController.swift
//  CustomAlert
//
//  Created by A K on 6/6/19.
//  Copyright © 2019 A K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var appearance: CustomAlertAppearance {
        var appearance = CustomAlertAppearance()
        
        //Colors
        appearance.backgroundColor = UIColor(red: 16/256, green: 32/256, blue: 50/256, alpha: 0.8)
        appearance.separatorColor = UIColor.red
        appearance.selectionColor = UIColor(red: 5/256, green: 10/256, blue: 15/256, alpha: 1)
        appearance.textColor = UIColor(red: 31/256, green: 154/256, blue: 254/256, alpha: 1)
        appearance.textColor = UIColor(red: 31/256, green: 154/256, blue: 254/256, alpha: 1)
        appearance.cencelButtonColor = UIColor.red
        
        appearance.headerColor = UIColor(red: 16/256, green: 32/256, blue: 50/256, alpha: 0.8)
        appearance.headerTitleColor = UIColor.lightGray
        appearance.headerMessageColor = UIColor.lightGray.withAlphaComponent(0.6)
        
        //Fonts
        appearance.headerTitleFont = UIFont.systemFont(ofSize: 14)
        appearance.headerMessageFont = UIFont.systemFont(ofSize: 12)
        appearance.buttonTextFont = UIFont.systemFont(ofSize: 16)
        
        return appearance
    }


    @IBAction func action(_ sender: Any) {
        let actionSheet = CustomAlert()
        actionSheet.appearance = appearance
        
        let header = CustomAlertHeaderView(message: "Twitter.com Twitter.com Twitter.co Twitter.com Twitter.com Twitter.com")
        
        let openButton = CustomAlertButton(title: "Open in Open in Open in Open in Open in Open in") {
            
            self.actionLabel.text = "Open in..."
        }
        
        let copyButton = CustomAlertButton(icon: UIImage(named: "2")!,
                                           title: "Copy Link") {
                                            
                                            self.actionLabel.text = "Copy Link"
        }
        
        let readingButton = ActionSheetButton(title: "Add to Reading List") {
            self.actionLabel.text = "Add to Reading List"
        }
        
        actionSheet.addCancelButonWith(title: "Cancel") {
            // when tap om cancel button
        }
        
        actionSheet.addItems([header, openButton, copyButton, readingButton])
        actionSheet.show(from: self)

    }
    
}

