//
//  LikeRemote.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

class LikeRemote: BaseRemote<LikeAPI> {
    func postLike(_ index: Int ) -> AnyPublisher<String, Error> {
        return self.request(.postLike(index))
            .map { _ in "좋아요에 성공했습니다." }
            .eraseToAnyPublisher()
    }
    
    func deleteLike(_ index: Int) -> AnyPublisher<String, Error> {
        return self.request(.deleteLike(index))
            .map { _ in "좋아요에 실패했습니다." }
            .eraseToAnyPublisher()
    }
}
