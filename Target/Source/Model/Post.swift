//
//  Post.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

struct Post: Codable, Hashable {
    var index: Int;
    var content: String;
    var createdAt: Date
    var images: [String];
    var likeCount: Int;
    var isLike: Bool;
    
    // Codable
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.index == rhs.index
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(index)
    }
    
    // Codable
    enum PostKeys: String, CodingKey {
        case index = "index"
        case content = "content"
        case createdAt = "created_at"
        case images = "images"
        case likeCount = "like_count"
        case isLike = "is_like"
    }
    
    // General
    internal init(index: Int, content: String, createdAt: Date, images: [String], likeCount: Int, isLike: Bool) {
        self.index = index
        self.content = content
        self.createdAt = createdAt
        self.images = images
        self.likeCount = likeCount
        self.isLike = isLike
    }
}
