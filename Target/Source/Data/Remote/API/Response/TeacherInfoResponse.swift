//
//  TeacherInfoResponse.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct TeacherInfoResponse: Codable {
    var name: String
    var profileImageUrl: String

    enum TeacherInfoResponseKeys: String, CodingKey {
        case name = "name"
        case profileImageUrl = "profile_image_url"
    }
}
