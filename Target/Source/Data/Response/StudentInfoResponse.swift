//
//  StudentInfoResponse.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct StudentInfoResponse: Codable {
    var name: String
    var gcn: String
    var profileImageUrl: String

    enum StudentInfoResponseKeys: String, CodingKey {
        case name = "name"
        case gcn = "gcn"
        case profileImageUrl = "profile_image_url"
    }
}
