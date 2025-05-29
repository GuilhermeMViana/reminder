//
//  Strint+Ext.swift
//  Reminder
//
//  Created by Guilherme Muniz Viana on 29/05/25.
//

import Foundation

extension String {
    var localized: String {
       return NSLocalizedString(self, comment: "")
    }
}
