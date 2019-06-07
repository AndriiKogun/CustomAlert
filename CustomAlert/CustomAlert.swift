//
//  CustomAlert.swift
//  CustomAlert
//
//  Created by A K on 6/6/19.
//  Copyright © 2019 A K. All rights reserved.
//

import UIKit

class CustomAlert: UIViewController {
    
    var appearance = CustomAlertAppearance()
    
    func show(from viewController: UIViewController) {
        modalPresentationStyle = .overFullScreen
        viewController.present(self, animated: false, completion: nil)
    }
    
    func addAction(_ action: CustomAlertAction) {
        headerView.appearance = appearance
        action.appearance = appearance
        stackView.addArrangedSubview(action)
    }
    
    func hide() {
        hideAction()
    }
    
    //MARK: - Private
    private var containerView: UIView = {
        let containerView = UIView()
        containerView.contentMode = .scaleAspectFill
        containerView.layer.cornerRadius = 16.0
        containerView.clipsToBounds = true
        return containerView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor.clear
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
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
    
    init(header: CustomAlertHeaderView) {
        self.headerView = header
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAction()
    }
    
    private func showAction() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc private func hideAction() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.clear
            self.view.layoutIfNeeded()
            
        }, completion: { (completion) in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    private func setupLayout() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        containerView.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
