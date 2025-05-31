//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 27/05/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    let loginView =  LoginBottomSheetView()
    let viewModel = LoginBottomSheetViewModel()
    var handleAreaHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.delegate = self
        
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        setupConstrainsts()
    }
    
    private func setupConstrainsts() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupGesture(){
        
    }
    
    private func handlePanGesture() {
        
    }
    
    private func bindViewModel() {
        viewModel.successResult = { [weak self] in
            print("Chegou na view controller")
        }
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in completion?() }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(usernameLogin: user, password: password)
    }
}
