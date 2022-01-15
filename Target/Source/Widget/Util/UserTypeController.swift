//
//  UserTypeController.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

class UserTypeController { // 0: student, 1: teacher
    private let preferences = UserDefaults.standard
    
    func setUserType(userType: UserType) {
        preferences.set(userType.rawValue, forKey: "userType")
    }
    
    func getUserType() -> UserType {
        return UserType(rawValue: preferences.value(forKey: "userType") as? Int ?? 1) ?? UserType.STUDENT
    }
    
    func deleteUserType() {
        preferences.set(nil, forKey: "userType")
    }
}

extension UserTypeController {
    static var controller: UserTypeController!
    
    static func getInstance() -> UserTypeController {
        if controller == nil {
            UserTypeController.controller = UserTypeController()
        }
        
        return .controller
    }
}
