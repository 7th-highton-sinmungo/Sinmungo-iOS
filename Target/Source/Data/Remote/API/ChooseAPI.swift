//
//  ChooseAPI.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum ChooseAPI {
    case postChoose(_ index: Int)
    case deleteChoose(_ index: Int)
}

extension ChooseAPI: TargetType {
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST + "choose")!
    }
    
    var path: String {
        switch self {
        case let .postChoose(index):
            return "/\(index)"
        case let .deleteChoose(index):
            return "/\(index)"
        }
    }
    
    var method: Method {
        switch self {
        case .postChoose:
            return .post
        case .deleteChoose:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .postChoose:
            return .requestPlain
        case .deleteChoose:
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


