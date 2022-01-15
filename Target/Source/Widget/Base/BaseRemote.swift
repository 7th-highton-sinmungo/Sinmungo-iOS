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
    let decoder = JSONDecoder()
    
    func request(_ target: MoyaProvider<T>.Target, callbackQueue: DispatchQueue? = nil) -> AnyPublisher<Moya.Response, Error> {
        if(!NetworkReachabilityManager(host: Constant.HOST)!.isReachable) {
            return Future<Moya.Response, Error> { result in
                result(.failure(SinmungoError.error(message: "서버에 접속할 수 없습니다.")))
            }
            .eraseToAnyPublisher()
        }
        
        return MoyaProvider().requestPublisher(target, callbackQueue: callbackQueue)
            .mapError { error -> Error in
                let errorBody = (try? error.response?.mapJSON() as? Dictionary<String, Any>) ?? Dictionary()
                
                return SinmungoError.error(
                    message: errorBody["message"] as? String ?? "네트워크 오류가 발생했습니다.",
                    errorBody: ["status": error.response?.statusCode ?? 0]
                )
            }
            .timeout(120, scheduler: DispatchQueue.main, customError: { SinmungoError.error(message: "요청시간이 만료되었습니다.") })
            .eraseToAnyPublisher()
    }
}
