//
//  PostRequest.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct PostRequest: Codable{
    let content: String
    let images: [String]
}
