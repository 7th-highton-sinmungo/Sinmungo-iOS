//
//  PostAPI.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum PostAPI{
    case getPosts(sort: SearchType)
    case getLikedPosts
    case postCreatePost(PostRequest)
    case postUpdatePost(PostRequest, Int)
    case postDeletePost(Int)
}

extension PostAPI: TargetType{
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST)!
    }
    
    var path: String {
        switch self{
        case .getPosts:
            return "/user/post"
        case .getLikedPosts:
            return "/user/post/liked"
        case .postCreatePost:
            return "/post"
        case let .postUpdatePost(_, index):
            return "/post/\(index)"
        case let .postDeletePost(index):
            return "/post/\(index)"
        }
    }
    
    var method: Method {
        switch self{
        case .getPosts, .getLikedPosts:
            return .get
        case .postCreatePost:
            return .post
        case .postUpdatePost:
            return .patch
        case .postDeletePost:
            return .delete
        }
    }
    
    var task: Task {
        switch self{
        case let .getPosts(sort):
            return .requestParameters(parameters: [
                "sort" : sort == .RECENT ? 0 : 1
            ], encoding: URLEncoding.queryString)
        case .getLikedPosts:
            return .requestPlain
        case let .postCreatePost(req):
            return .requestParameters(parameters: [
                "content" : req.content,
                "images" : req.images
            ], encoding: JSONEncoding.default)
        case let .postUpdatePost(req, _):
            return .requestParameters(parameters: [
                "content" : req.content,
                "images" : req.images
            ], encoding: JSONEncoding.default)
        case .postDeletePost:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        var headers = ["Content-Type": "application/json"]
        headers["authorization"] = "Bearer \(TokenController.getInstance().getToken())"
        
        return headers
    }
    
    
}
