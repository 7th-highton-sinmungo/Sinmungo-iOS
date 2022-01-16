//
//  BaseViewModel.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/16.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

class BaseViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage = "알 수 없는 오류가 발생했습니다."
    @Published var isErrorOcuured = false
    
    var bag = Set<AnyCancellable>()
    
    func addCancellable<T>(
        _ publisher: AnyPublisher<T, Error>,
        onReceiveValue: @escaping (T) -> Void,
        onReceiveFailure: ((Error) -> Void)? = nil
    ) {
        isLoading = true
        publisher
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    if let onReceiveFailure = onReceiveFailure {
                        onReceiveFailure(error)
                    }
                    
                    if let error = error as? SinmungoError,
                       case let .error(message, _) = error {
                        self?.errorMessage = message
                    }
                    else {
                        self?.errorMessage = "알 수 없는 오류가 발생했습니다."
                    }
                    
                    self?.isErrorOcuured = true
                }
                self?.isLoading = false
            }, receiveValue: onReceiveValue)
            .store(in: &bag)
    }
}
