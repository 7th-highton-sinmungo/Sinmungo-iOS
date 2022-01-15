//
//  PostAPI.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum PostAPI{
    case postCreatePost(PostRequest)
    case postUpdatePost(PostRequest, Int)
    case postDeletePost(Int)
}

extension PostAPI: TargetType{
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST + "/post")!
    }
    
    var path: String {
        switch self{
        case .postCreatePost:
            return ""
        case let .postUpdatePost(_, index):
            return "/\(index)"
        case let .postDeletePost(index):
            return "g/\(index)"
        }
    }
    
    var method: Method {
        switch self{
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
