//
//  PostRemote.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

final class PostRemote: BaseRemote<PostAPI>{
    func postCreatePost(_ req: PostRequest) -> AnyPublisher<String, Error>{
        return self.request(.postCreatePost(req))
            .map { _ in "게시글 등록에 성공하였습니다." }
            .eraseToAnyPublisher()
    }
    
    func patchUpdatePost(_ req: PostRequest, index: Int) -> AnyPublisher<String, Error>{
        return self.request(.patchUpdatePost(req, index+1))
            .map { _ in "게시글 수정에 성공하였습니다." }
            .eraseToAnyPublisher()
    }
    
    func deletePost(index: Int) -> AnyPublisher<String, Error> {
        return self.request(.deletePost(index+1))
            .map { _ in "게시글 삭제에 성공하였습니다." }
            .eraseToAnyPublisher()
    }
}
