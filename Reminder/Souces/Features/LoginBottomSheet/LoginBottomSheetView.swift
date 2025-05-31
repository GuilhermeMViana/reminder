//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 27/05/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView{
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let handleArea: UIView = {
       let view = UIView()
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLable: UILabel = {
        let title = UILabel()
        title.text = "login.label.title".localized
        title.textColor = Colors.gray100
        title.font = Typography.subHeading
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "login.email.label".localized
        emailLabel.textColor = Colors.gray100
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "login.password.label".localized
        passwordLabel.textColor = Colors.gray100
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private let passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "login.password.placeholder".localized
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.tittle".localized, for: .normal)
        button.backgroundColor = Colors.primaryBase
        button.tintColor = Colors.gray800
        button.layer.cornerRadius = Metrics.medium
        button.titleLabel?.font = Typography.subHeading
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(loginButtomDidTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = Colors.gray800
        self.layer.cornerRadius = Metrics.small
        
        addSubview(handleArea)
        addSubview(titleLable)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstrainsts()
    }
    
    private func setupConstrainsts() {
        
        NSLayoutConstraint.activate([
            
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLable.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.huge),
            titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: Metrics.medium),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.little),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.little),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
    
    @objc
    private func loginButtomDidTapped() {
        guard let user = emailTextField.text, let password = passwordTextField.text else {
            return
        }

        delegate?.sendLoginData(user: user, password: password)
    }
}
