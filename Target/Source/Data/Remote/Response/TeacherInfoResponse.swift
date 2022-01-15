//
//  TeacherInfoResponse.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct TeacherInfoResponse: Codable{
    let name: String
    let profileImageUrl: String
    enum CodingKeys: String, CodingKey{
        case name
        case profileImageUrl = "profile_image_url"
    }
}
