//
//  ProfileImageResponse.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct ProfileImageResponse: Codable {
    var profileImageUrl: String
    
    enum ProfileImageResponseKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProfileImageResponseKeys.self)
        
        profileImageUrl = try! container.decodeIfPresent(String.self, forKey: .profileImageUrl) ?? ""
    }
}
