//
//  UserAPI.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum UserAPI {
    case postLogin(request: LoginRequest)
    case getLikedPosts
    case getSortedPosts(sort: Int) // 0 - 최신순 / 1 - 좋아요순
}

extension UserAPI: TargetType {
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST + "user")!
    }
    
    var path: String {
        switch self {
        case .postLogin:
            return "/auth"
        case .getLikedPosts:
            return "/post/liked"
        case .getSortedPosts:
            return "/post"
        }
    }
    
    var method: Method {
        switch self {
        case .postLogin:
            return .post
        case .getLikedPosts:
            return .get
        case .getSortedPosts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .postLogin(request):
            return .requestData(try! JSONEncoder().encode(request))
        case .getLikedPosts:
            return .requestPlain
        case let .getSortedPosts(sort):
            return .requestParameters(parameters: ["sort": sort], encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        var headers = ["Content-Type": "application/json"]
        headers["authorization"] = "Bearer \(TokenController.getInstance().getToken())"
        
        return headers
    }
}
