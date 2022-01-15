//
//  SignInVM.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine

final class SignInViewModel: ObservableObject {
    // MARK: - Properties
    @Published var id = ""
    @Published var password = ""
    
    private var bag = Set<AnyCancellable>()
    
    
    // MARK: - Init
    init(){
        
        bindInput()
        bindOutput()
    }
    
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
            
        default:
            return
        }
    }
    private func bindInput(){
        
    }
    
    // MARK: - Output
    private func bindOutput(){
        
    }
}
