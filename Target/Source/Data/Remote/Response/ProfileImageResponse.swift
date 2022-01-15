//
//  ProfileImageResponse.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct ProfileImageResponse: Codable{
    let profileImageUrl: String
    enum CodingKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url"
    }
}
