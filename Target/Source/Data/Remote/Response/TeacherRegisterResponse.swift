//
//  TeacherRegisterResponse.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct TeacherRegisterResponse: Codable{
    let accessToken: String
    enum CodingKeys: String, CodingKey{
        case accessToken = "access_token"
    }
}
