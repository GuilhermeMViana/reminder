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
    private let viewControllerFactory: ViewControllersFactoryProtocol
//MARK: - Init
    public init(){
        self.viewControllerFactory = ViewControllersFactory()
    }
//MARK: - startFlow
    func start()-> UINavigationController?{
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
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
        self.navigationController?.dismiss(animated: false)
        //let homeViewController = HOMEViewController()
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .systemBlue
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

