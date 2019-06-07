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
        
        let header = CustomAlertHeaderView(title: "Some title",
                                           message: "Twitter.com Twit")
        
        let actionSheet = CustomAlert(header: header)
        actionSheet.appearance = appearance
        
        let camcel = CustomAlertAction(title: "Cancel") {
            
        }
        
        let ok = CustomAlertAction(title: "OK") {
            
        }

        actionSheet.addAction(camcel)
        actionSheet.addAction(ok)
        
        actionSheet.show(from: self)
    }
}

