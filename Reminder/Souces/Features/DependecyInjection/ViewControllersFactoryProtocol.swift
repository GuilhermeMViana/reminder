//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 02/06/25.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
}
