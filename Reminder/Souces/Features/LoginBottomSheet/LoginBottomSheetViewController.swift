//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 27/05/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    let viewModel = LoginBottomSheetViewModel()
    let contentView: LoginBottomSheetView
    var handleAreaHeight: CGFloat = 50
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(contentView: LoginBottomSheetView, flowDelegate: LoginBottomSheetFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    private func setupUI() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupConstrainsts()
    }
    
    private func setupConstrainsts() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupGesture(){
        
    }
    
    private func handlePanGesture() {
        
    }
    
    private func bindViewModel() {
        viewModel.successResult = { [weak self] usernameLogin in
            self?.presentSaveUserLoginAlert(email: usernameLogin)
        }
        
        viewModel.errorResult = { [weak self] error in
            self?.presentErrorAlert(message: error)
        }
    }
    
    private func presentSaveUserLoginAlert(email: String) {
        let alert = UIAlertController(title: "Salvar acesso", message: "Deseja se manter conectado?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Sim", style: .default) { _ in
            let user = User(email: email, isSaved: true)
            UserDefaultsManager.saveUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let denyAction = UIAlertAction(title: "Não", style: .cancel) { _ in
            self.flowDelegate?.navigateToHome()
        }
        
        alert.addAction(saveAction)
        alert.addAction(denyAction)
        self.present(alert, animated: true)
    }
    
    private func presentErrorAlert(message: String){
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Tentar novamente", style: .default)
        
        alert.addAction(retryAction)
        
        self.present(alert, animated: true)
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in completion?() }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(usernameLogin: user, password: password)
    }
}
