//
//  PostRepository.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

protocol PostRepository{
    func createPost(req: PostRequest) -> AnyPublisher<Void, Error>
    
    func applyUpdatePost(req: PostRequest) -> AnyPublisher<Void, Error>
    
    func applyDeletePost(req: PostRequest) -> AnyPublisher<Void, Error>
}
