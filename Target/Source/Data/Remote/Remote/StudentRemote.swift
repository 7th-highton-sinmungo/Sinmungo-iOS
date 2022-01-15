//
//  StudentRemote.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

class StudentRemote: BaseRemote<StudentAPI> {
    func postLogin(_ request: StudentRegisterRequest) -> AnyPublisher<String, Error> {
        return self.request(.postRegister(request))
            .map(TokenResponse.self, using: decoder)
            .map { $0.accessToken }
            .eraseToAnyPublisher()
    }
    
    func getLikedPosts() -> AnyPublisher<StudentUser, Error> {
        return self.request(.getUserInfo)
            .map(StudentUser.self, using: decoder)
            .eraseToAnyPublisher()
    }
}
