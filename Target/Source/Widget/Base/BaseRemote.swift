//
//  BaseRemote.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import Moya
import Alamofire

class BaseRemote<T: TargetType> {
    let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    let decoder = JSONDecoder()
    
    func request(_ target: MoyaProvider<T>.Target, callbackQueue: DispatchQueue? = nil) -> AnyPublisher<Moya.Response, Error> {
        if(!NetworkReachabilityManager(host: Constants.DEFAULT_HOST)!.isReachable) {
            return Future<Moya.Response, Error> { result in
                result(.failure(SinmungoError.error(message: "서버에 접속할 수 없습니다.")))
            }
            .eraseToAnyPublisher()
        }
        
        return provider.requestPublisher(target, callbackQueue: callbackQueue)
            .mapError { SinmungoError.error(errorBody: ["status": $0.response?.statusCode ?? 0]) }
            .timeout(120, scheduler: DispatchQueue.main, customError: { SinmungoError.error(message: "요청시간이 만료되었습니다.") })
            .eraseToAnyPublisher()
    }
}
