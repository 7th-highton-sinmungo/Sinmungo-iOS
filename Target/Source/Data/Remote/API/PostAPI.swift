//
//  PostAPI.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum PostAPI{
    case postCreatePost(_ request: PostRequest)
    case postUpdatePost(_ request: PostRequest, _ index: Int)
    case postDeletePost(_ index: Int)
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
            return "/\(index)"
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
        case let .postCreatePost(request):
            return .requestData(try! JSONEncoder().encode(request))
        case let .postUpdatePost(request, _):
            return .requestData(try! JSONEncoder().encode(request))
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
