//
//  TeacherRemote.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

final class TeacherRemote: BaseRemote<TeacherAPI>{
    func postRegister(_ request: TeacherRegisterRequest) -> AnyPublisher<String, Error> {
        return self.request(.postRegister(request))
            .map(TokenResponse.self, using: decoder)
            .map { $0.accessToken }
            .map { token in
                TokenController.getInstance().login(token: token)
                UserTypeController.getInstance().setUserType(userType: .TEACHER)
                return token
            }
            .eraseToAnyPublisher()
    }
    
    func getUserInfo() -> AnyPublisher<TeacherUser, Error>{
        return self.request(.getUserInfo)
            .map(TeacherUser.self, using: decoder)
            .eraseToAnyPublisher()
    }
}
