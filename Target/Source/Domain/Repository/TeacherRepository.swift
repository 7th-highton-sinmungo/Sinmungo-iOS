//
//  TeacherRepository.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

protocol TeacherRepository {
    func applyRegister(req: TeacherRegisterRequest) -> AnyPublisher<TokenResponse, Error>
    
    func fetchTeacherInfo() -> AnyPublisher<TeacherUser, Error>
}
