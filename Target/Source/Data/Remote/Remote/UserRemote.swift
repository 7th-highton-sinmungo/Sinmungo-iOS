//
//  UserRemote.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

class UserRemote: BaseRemote<UserAPI> {
    func postLogin(_ request: LoginRequest) -> AnyPublisher<String, Error> {
        return self.request(.postLogin(request))
            .map(TokenResponse.self, using: decoder)
            .map { $0.accessToken }
            .eraseToAnyPublisher()
    }
    
    func getLikedPosts() -> AnyPublisher<[Post], Error> {
        return self.request(.getLikedPosts)
            .map(PostResponse.self, using: decoder)
            .map { $0.postList }
            .eraseToAnyPublisher()
    }
    
    func getSortedPosts(_ sort: Int) -> AnyPublisher<[Post], Error> {
        return self.request(.getSortedPosts(sort))
            .map(PostResponse.self, using: decoder)
            .map { $0.postList }
            .eraseToAnyPublisher()
    }
    
    func postLogin() -> AnyPublisher<[Post], Error> {
        return self.request(.getChosenPosts)
            .map(PostResponse.self, using: decoder)
            .map { $0.postList }
            .eraseToAnyPublisher()
    }
}
