//
//  Post.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct Post: Codable, Hashable {
    var index: Int
    var content: String
    var createdAt: String
    var images: [String]
    var likeCount: Int
    var isLike: Bool
    var isChosen: Bool
    var isMine: Bool
    
    // Codable
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.index == rhs.index
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(index)
    }
    
    // Codable
    enum CodingKeys: String, CodingKey {
        case index = "index"
        case content = "content"
        case createdAt = "created_at"
        case images = "images"
        case likeCount = "like_count"
        case isLike = "liked"
        case isChosen = "chosen"
        case isMine = "mine"
    }
    
    // General
    internal init(index: Int, content: String, createdAt: String, images: [String], likeCount: Int, isLike: Bool, isChosen: Bool, isMine: Bool) {
        self.index = index
        self.content = content
        self.createdAt = createdAt
        self.images = images
        self.likeCount = likeCount
        self.isLike = isLike
        self.isChosen = isChosen
        self.isMine = isMine
    }
}
