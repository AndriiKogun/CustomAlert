//
//  CustomAlertButton.swift
//  CustomAlert
//
//  Created by A K on 6/7/19.
//  Copyright © 2019 A K. All rights reserved.
//

import UIKit

class CustomAlertButton: CustomAlertItem {

    override var appearance: CustomAlertAppearance! {
        didSet {
            setupLayout()
            contentView.backgroundColor = appearance.backgroundColor
        }
    }
    
    private let title: String
    
    private lazy var iconImageView = UIImageView()
    
    private var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var sheetButton: UIButton = {
        let sheetButton = UIButton()
        sheetButton.addTarget(self, action: #selector(touchDownAction(_:)), for: .touchDown)
        sheetButton.addTarget(self, action: #selector(touchDragOutsideAction(_:)), for: .touchDragOutside)
        sheetButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return sheetButton
    }()
    
    private lazy var separatorView: UIView = {
        var separatorView = UIView()
        separatorView.backgroundColor = appearance.separatorColor
        return separatorView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = appearance.textColor
        titleLabel.text = title
        titleLabel.font = appearance.buttonTextFont
        titleLabel.lineBreakMode = .byTruncatingMiddle
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        return titleLabel
    }()
    
    init(title: String, tappedBlock: @escaping () -> Void) {
        self.title = title
        super.init(frame: CGRect.zero)
        self.dissmissBlock = tappedBlock
    }
    
    convenience init(icon: UIImage, title: String, tappedBlock: @escaping () -> Void) {
        self.init(title: title, tappedBlock: tappedBlock)
        iconImageView.image = icon
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideSeparator() {
        separatorView.backgroundColor = appearance.backgroundColor
    }
    
    private func setupLayout() {
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
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
        
        if iconImageView.image == nil {
            contentView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32).isActive = true
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32).isActive = true
        } else {
            contentView.addSubview(iconImageView)
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32).isActive = true
            
            contentView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            titleLabel.leftAnchor.constraint(greaterThanOrEqualTo: iconImageView.rightAnchor, constant: 8).isActive = true
        }
        
        contentView.addSubview(sheetButton)
        sheetButton.translatesAutoresizingMaskIntoConstraints = false
        sheetButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        sheetButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        sheetButton.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        sheetButton.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    @objc private func touchDownAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.contentView.backgroundColor = self.appearance.selectionColor
            self.separatorView.backgroundColor = self.appearance.selectionColor
            
        }
    }
    
    @objc private func touchDragOutsideAction(_ sender: UIButton) {
        self.contentView.backgroundColor = self.appearance.backgroundColor
        self.separatorView.backgroundColor = self.appearance.separatorColor
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        delegate?.hide()
        if let dissmissBlock = dissmissBlock {
            dissmissBlock()
        }
    }
}
