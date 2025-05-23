//
//  SplashView.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 23/05/25.
//

import Foundation
import UIKit

class SplashView: UIView {
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .red
        setupConstraints()
    }
    
    private func setupConstraints() {}
}
