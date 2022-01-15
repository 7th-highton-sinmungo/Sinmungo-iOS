//
//  ImageRemote.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import Moya

class ImageRemote: BaseRemote<ImagesAPI> {
    func postUploadProfileImage(_ requests: [UploadRequest]) -> AnyPublisher<String, Error> {
        if let requests = getImageMulipartFormData(requests, name: "profile_image"), requests.count > 0 {
            return self.request(.postUploadProfileImage(requests))
                .map(ProfileImageResponse.self, using: decoder)
                .map { $0.profileImageUrl }
                .eraseToAnyPublisher()
        }
        return Future<String, Error> { result in
            result(.success(""))
        }
        .eraseToAnyPublisher()
    }
    
    func postUploadPostImages(_ requests: [UploadRequest]) -> AnyPublisher<[String], Error> {
        if let requests = getImageMulipartFormData(requests, name: "post_images"), requests.count > 0 {
            return self.request(.postUploadPostImages(requests))
                .map(PostImagesResponse.self, using: decoder)
                .map { $0.images }
                .eraseToAnyPublisher()
        }
        return Future<[String], Error> { result in
            result(.success([]))
        }
        .eraseToAnyPublisher()
    }
}

extension ImageRemote {
    private func getImageMulipartFormData(_ requests: [UploadRequest], name: String) -> [MultipartFormData]? {
        var imageData: [MultipartFormData] = []
        
        for request in requests {
            var imgData: Data? = nil
            switch request.type {
                case .JPEG:
                imgData = request.image.jpegData(compressionQuality: 0.2)
                case .PNG:
                imgData = request.image.pngData()
                default:
                    return nil
            }
            
            guard let imgData = imgData else {
                return nil
            }
            
            imageData.append(
                MultipartFormData(
                    provider: .data(imgData),
                    name: name,
                    fileName: request.name,
                    mimeType: request.type.mimeType
                )
            )
        }
        
        return imageData
    }
}
