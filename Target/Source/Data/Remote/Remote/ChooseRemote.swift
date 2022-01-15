//
//  ChooseRemote.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

class ChooseRemote: BaseRemote<ChooseAPI> {
    func postChoose(_ index: Int) -> AnyPublisher<String, Error> {
        return self.request(.postChoose(index))
            .map { _ in "채택에 성공했습니다." }
            .eraseToAnyPublisher()
    }
    
    func deleteChoose(_ index: Int) -> AnyPublisher<String, Error> {
        return self.request(.deleteChoose(index))
            .map { _ in "채택에 실패했습니다." }
            .eraseToAnyPublisher()
    }
}
