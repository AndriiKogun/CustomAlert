//
//  CustomAlertHeaderView.swift
//  CustomAlert
//
//  Created by A K on 6/7/19.
//  Copyright © 2019 A K. All rights reserved.
//

import UIKit

class CustomAlertHeaderView: CustomAlertItem {

    private var title: String?
    private var message: String?
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = appearance.headerColor
        return contentView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = appearance.headerTitleColor
        titleLabel.font = appearance.headerTitleFont
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.textColor = appearance.headerMessageColor
        messageLabel.font = appearance.headerMessageFont
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    
    private lazy var separatorView: UIView = {
        var separatorView = UIView()
        separatorView.backgroundColor = appearance.separatorColor
        return separatorView
    }()
    
    init(title: String) {
        super.init(frame: CGRect.zero)
        self.title = title
    }
    
    init(message: String) {
        super.init(frame: CGRect.zero)
        self.message = message
    }
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var appearance: CustomAlertAppearance! {
        didSet {
            setupLayout()
            contentView.backgroundColor = appearance.backgroundColor
        }
    }
    
    private func setupLayout() {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        if message == nil {
            contentView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:-16).isActive = true
        } else if title == nil {
            contentView.addSubview(messageLabel)
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true
            messageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
            messageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:-16).isActive = true
        } else {
            contentView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:-16).isActive = true
            
            contentView.addSubview(messageLabel)
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
            messageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
            messageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:-16).isActive = true
        }
    }
}
