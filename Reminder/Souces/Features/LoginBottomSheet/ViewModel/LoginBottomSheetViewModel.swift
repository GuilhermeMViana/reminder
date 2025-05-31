//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 30/05/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    var successResult: (() -> Void)?
    
    func doAuth(usernameLogin: String, password: String){
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Dados inválidos: \(error.localizedDescription)")
            } else {
                self?.successResult?()
            }
        }
            
    }
}
