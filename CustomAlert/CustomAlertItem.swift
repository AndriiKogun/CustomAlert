//
//  CustomAlertItem.swift
//  CustomAlert
//
//  Created by A K on 6/7/19.
//  Copyright © 2019 A K. All rights reserved.
//

import UIKit

class CustomAlertItem: UIView {

    weak var delegate: CustomAlert?
    var dissmissBlock: (() -> Void)?
    var appearance: CustomAlertAppearance!
}
