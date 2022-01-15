//
//  StudentAPI.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum StudentAPI {
    case postRegister(_ request: StudentRegisterRequest)
    case getUserInfo
    case getMyPosts
}

extension StudentAPI: TargetType {
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST + "student")!
    }
    
    var path: String {
        switch self {
        case .postRegister:
            return ""
        case .getUserInfo:
            return "/info"
        case .getMyPosts:
            return "/post"

        }
    }
    
    var method: Method {
        switch self {
        case .postRegister:
            return .post
        case .getUserInfo:
            return .get
        case .getMyPosts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .postRegister(request):
            return .requestData(try! JSONEncoder().encode(request))
        case .getUserInfo:
            return .requestPlain
        case .getMyPosts:
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

