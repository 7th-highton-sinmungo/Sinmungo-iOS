//
//  LoginResponse.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    var accessToken: String
    var authority: UserType
    
    enum TokenResponseKeys: String, CodingKey {
        case accessToken = "access_token"
        case authority = "authority"
    }
}
