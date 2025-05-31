//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 29/05/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
