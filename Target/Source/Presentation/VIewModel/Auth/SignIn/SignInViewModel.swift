//
//  SignInVM.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

final class SignInViewModel: BaseViewModel {
    // MARK: - Properties
    @Published var id = ""
    @Published var password = ""
    @Published var isSuccess = false
    
    
    private let userRemote = UserRemote()
    deinit {
        bag.removeAll()
    }
    
    // MARK: - Input
    enum Input{
        case signInButtonDidTap
    }
    
    func reset(){
        self.id = ""
        self.password = ""
    }
    
    
    func apply(_ input: Input) {
        switch input{
        case .signInButtonDidTap:
            login()
        }
    }
    
    private func login(){
        guard !id.isEmpty, !password.isEmpty else {
            return
        }
        
        addCancellable(userRemote.postLogin(.init(id: id, password: password))) { [weak self] _ in
            self?.isSuccess = true
        }

    }
}
