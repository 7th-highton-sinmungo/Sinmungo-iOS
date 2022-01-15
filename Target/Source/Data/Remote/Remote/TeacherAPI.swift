//
//  TeacherAPI.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum TeacherAPI {
    case postRegister(request: TeacherRegisterRequest)
    case getUserInfo
    case getChosenPosts
}

extension TeacherAPI: TargetType {
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST + "teacher")!
    }
    
    var path: String {
        switch self {
        case .postRegister:
            return "/"
        case .getUserInfo:
            return "/info"
        case .getChosenPosts:
            return "/post/chosen"
        }
    }
    
    var method: Method {
        switch self {
        case .postRegister:
            return .post
        case .getUserInfo:
            return .get
        case .getChosenPosts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .postRegister(request):
            return .requestData(try! JSONEncoder().encode(request))
        case .getUserInfo:
            return .requestPlain
        case .getChosenPosts:
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
