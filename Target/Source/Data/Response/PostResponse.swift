//
//  PostResponse.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct PostResponse: Codable {
    var postList: [Post]
    
    enum PostResponseKeys: String, CodingKey {
        case postList = "post_list"
    }
}
