//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 31/05/25.
//

import Foundation

public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}
