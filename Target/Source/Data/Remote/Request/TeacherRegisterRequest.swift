//
//  TeacherRegisterRequest.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

class TeacherRegisterRequest: Codable {
    var id: String
    var password: String
    var name: String
    var profileImageUrl: String
    
    enum TeacherRegisterRequestKeys: String, CodingKey {
        case id = "id"
        case password = "password"
        case name = "name"
        case profileImageUrl = "profile_image_url"
    }
}
