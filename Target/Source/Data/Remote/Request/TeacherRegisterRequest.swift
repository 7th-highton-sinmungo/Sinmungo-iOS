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
    var profile_image_url: String
}
