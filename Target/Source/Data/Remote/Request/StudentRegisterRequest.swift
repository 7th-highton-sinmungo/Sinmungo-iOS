//
//  StudentRegisterRequest.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct StudentRegisterRequest: Codable {
    var id: String
    var password: String
    var name: String
    var grade: Int
    var classNum: Int
    var number: Int
    var profileImageUrl: String
    
    enum StudentRegisterRequestKeys: String, CodingKey {
        case id = "id"
        case password = "password"
        case name = "name"
        case grade = "grade"
        case classNum = "class_num"
        case number = "number"
        case profileImageUrl = "profile_image_url"
    }
}
