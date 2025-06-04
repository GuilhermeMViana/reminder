//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 30/05/25.
//

import Foundation
import FirebaseAuth

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    
    func doAuth(usernameLogin: String, password: String){
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorResult?("Usúario ou senha inválidos")
            } else {
                self?.successResult?(usernameLogin)
            }
        }
            
    }
}
