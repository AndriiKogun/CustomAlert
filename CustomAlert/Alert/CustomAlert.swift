//
//  CustomAlert.swift
//  CustomAlert
//
//  Created by A K on 6/6/19.
//  Copyright © 2019 A K. All rights reserved.
//

import UIKit

class CustomAlert: UIViewController {
    
    init(title: String?, message: String?, appearance: CustomAlertAppearance?) {
        let appearance = appearance ?? CustomAlertAppearance()
        self.appearance = appearance
        self.headerView = CustomAlertHeaderView(title: title, message: message, appearance: appearance)
        super.init(nibName: nil, bundle: nil)
    }
    
    func show(from viewController: UIViewController) {
        modalPresentationStyle = .overFullScreen
        viewController.present(self, animated: false, completion: nil)
    }
    
    func addAction(_ action: CustomAlertAction) {
        action.appearance = appearance
        action.dissmissBlock = {
            self.hideAction()
        }
        
        if stackView.arrangedSubviews.isEmpty {
            action.hideSeparator()
        }
        
        stackView.addArrangedSubview(action)
    }
    
    private lazy var separatorView: UIView = {
        var separatorView = UIView()
        separatorView.backgroundColor = UIColor.green
        return separatorView
    }()

    
    //MARK: - Private
    private var containerView: UIView = {
        let containerView = UIView()
        containerView.contentMode = .scaleAspectFill
        containerView.layer.cornerRadius = 16.0
        containerView.clipsToBounds = true
        containerView.alpha = 0
        return containerView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor.clear
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private var hasHomeIndicator: Bool {
        guard #available(iOS 11.0, *), let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom, bottomPadding > 0 else {
            return false
        }
        return true
    }
    
    private var cancelBlock: (() -> Void)?
    
    private let headerView: CustomAlertHeaderView
    private let appearance: CustomAlertAppearance
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLayout()
        showAction()
    }
    
    private func showAction() {
        containerView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)

        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.alpha = 1
            self.containerView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    private func hideAction() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.clear
        }, completion: { (completion) in
            self.dismiss(animated: false, completion: nil)
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.alpha = 0
        }, completion: nil)
    }
    
    private func setupLayout() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 266).isActive = true
        
        containerView.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
