//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 31/05/25.
//

import Foundation
import UIKit

class ReminderFlowController {
    //Mark: - Properties
    private var navigationController: UINavigationController?
    // private let viewControllerFactory
    //Mark: - Init
    public init(){}
    //Mark: - startFlow
    func start()-> UINavigationController?{
        // let startViewController: viewControllerFactory
        let startViewController = SplashViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
    //Mark: - Splash
    //Mark: - LoginBottomSheet
}
