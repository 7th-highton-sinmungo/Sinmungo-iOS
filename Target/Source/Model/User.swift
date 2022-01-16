//
//  User.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct StudentUser: Codable {
    var name: String
    var gcn: String
    var profileImageUrl: String
    
    // Codable
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gcn = "gcn"
        case profileImageUrl = "profile_image_url"
    }
    
    // General
    internal init(name: String, gcn: String, profileImageUrl: String) {
        self.name = name
        self.gcn = gcn
        self.profileImageUrl = profileImageUrl
    }
}

struct TeacherUser: Codable {
    var name: String
    var profileImageUrl: String
    
    // Codable
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case profileImageUrl = "profile_image_url"
    }
    
    // General
    internal init(name: String, profileImageUrl: String) {
        self.name = name
        self.profileImageUrl = profileImageUrl
    }
}
