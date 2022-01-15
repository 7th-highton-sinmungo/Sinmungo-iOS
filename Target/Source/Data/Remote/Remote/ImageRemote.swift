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
        return self.request(.postUploadProfileImage(getImageMulipartFormData(requests, name: "profile_image")))
            .map(ProfileImageResponse.self, using: decoder)
            .map { $0.profileImageUrl }
            .eraseToAnyPublisher()
    }
    
    func postUploadPostImages(_ requests: [UploadRequest]) -> AnyPublisher<[String], Error> {
        return self.request(.postUploadPostImages(getImageMulipartFormData(requests, name: "post_images")))
            .map(PostImagesResponse.self, using: decoder)
            .map { $0.images }
            .eraseToAnyPublisher()
    }
}

extension ImageRemote {
    private func getImageMulipartFormData(_ requests: [UploadRequest], name: String) -> [MultipartFormData] {
        var imageData: [MultipartFormData] = []
        
        for request in requests {
            var imgData: Data? = nil
            switch request.type {
                case .JPEG:
                imgData = request.image.jpegData(compressionQuality: 0.2)!
                case .PNG:
                imgData = request.image.pngData()
                default:
                    return []
            }
            
            imageData.append(
                MultipartFormData(
                    provider: .data(imgData!),
                    name: name,
                    fileName: request.name,
                    mimeType: request.type.mimeType
                )
            )
        }
        
        return imageData
    }
}
