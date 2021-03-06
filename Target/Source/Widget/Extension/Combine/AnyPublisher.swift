//
//  AnyPublisher.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import Moya

extension AnyPublisher where Output == Moya.Response, Failure == Error {
    func map<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder(), failsOnEmptyData: Bool = true) -> AnyPublisher<D, Error> {
        return unwrapThrowable { response in
            try response.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
        }
    }
}

extension AnyPublisher where Failure == Error {
    func unwrapThrowable<T>(throwable: @escaping (Output) throws -> T) -> AnyPublisher<T, Error> {
        self.tryMap { element in
            try throwable(element)
        }
        .eraseToAnyPublisher()
    }
}
