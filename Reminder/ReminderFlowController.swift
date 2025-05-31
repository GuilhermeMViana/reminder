//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 31/05/25.
//

import Foundation
import UIKit

class ReminderFlowController {
    
//MARK: - Properties
    private var navigationController: UINavigationController?
    // private let viewControllerFactory
//MARK: - Init
    public init(){}
//MARK: - startFlow
    func start()-> UINavigationController?{
        // let startViewController: viewControllerFactory
        let startViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
            
        }
    }
}

//MARK: - LoginBottomSheet
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        //let homeViewController = HOMEViewController()
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .systemBlue
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

