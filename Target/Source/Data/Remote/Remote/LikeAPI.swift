//
//  LikeAPI.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum LikeAPI {
    case postLike(index: Int)
    case deleteLike(index: Int)
}

extension LikeAPI: TargetType {
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST + "like")!
    }
    
    var path: String {
        switch self {
        case let .postLike(index):
            return "/\(index)"
        case let .deleteLike(index):
            return "/\(index)"
        }
    }
    
    var method: Method {
        switch self {
        case .postLike:
            return .post
        case .deleteLike:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .postLike:
            return .requestPlain
        case .deleteLike:
            return .requestPlain
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
