//
//  ImagesAPI.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Moya

enum ImagesAPI {
    case postUploadProfileImage(_ image: [MultipartFormData])
    case postUploadPostImages(_ image: [MultipartFormData])
}

extension ImagesAPI: TargetType {
    var baseURL: URL {
        return URL(string: Constants.DEFAULT_HOST + "images")!
    }
    
    var path: String {
        switch self {
        case .postUploadProfileImage:
            return "/profile"
        case .postUploadPostImages:
            return "/post"
        }
    }
    
    var method: Method {
        switch self {
        case .postUploadProfileImage:
            return .post
        case .postUploadPostImages:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .postUploadProfileImage(images):
            return .uploadMultipart(images)
        case let .postUploadPostImages(images):
            return .uploadMultipart(images)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        var headers = ["Content-Type": "multipart/form-data"]
        headers["authorization"] = "Bearer \(TokenController.getInstance().getToken())"
        
        return headers
    }
}

