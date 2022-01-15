//
//  TokenController.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

class TokenController {
    let preferences = UserDefaults.standard
    
    func getToken() -> String {
        return preferences.value(forKey: "token") as? String ?? ""
    }
    
    func login(token: String) {
        preferences.set(token, forKey: "token")
    }
    
    func logout() {
        preferences.set(nil, forKey: "token")
    }
}

extension TokenController {
    private static var controller: TokenController!
    
    static func getInstance() -> TokenController {
        if controller == nil {
            TokenController.controller = TokenController()
        }
        
        return .controller
    }
}
