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
    var grade: String
    var classNum: String
    var number: String
    var profileImageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case password
        case name
        case grade
        case classNum = "class_num"
        case number
        case profileImageUrl = "profile_image_url"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(password, forKey: .password)
        try container.encode(name, forKey: .name)
        try container.encode(grade, forKey: .grade)
        try container.encode(classNum, forKey: .classNum)
        try container.encode(number, forKey: .number)
        try container.encode(profileImageUrl, forKey: .profileImageUrl)
    }
}
