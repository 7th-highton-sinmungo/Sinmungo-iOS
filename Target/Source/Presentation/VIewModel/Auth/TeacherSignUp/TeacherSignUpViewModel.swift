//
//  TeacherSignUpViewModel.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import UIKit

final class TeacherSignUpViewModel: ObservableObject{
    // MARK: - Properties
    @Published var name = ""
    @Published var id = ""
    @Published var password = ""
    @Published var profileImage: [UploadRequest] = []
    
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Init
    init(){
        
    }
    
    deinit {
        bag.removeAll()
    }
    
    // MARK: - Input
    enum Input{
        case signUpButtonDidTap
    }
    func reset(){
        self.name = ""
        self.id = ""
        self.password = ""
        self.profileImage = []
    }
    
    func apply(_ input: Input){
        switch input{
        case .signUpButtonDidTap:
            break
        }
    }
    
    func bindInput(){
        
    }
    
    
    // MARK: - Output
    func bindOutput(){
        
    }
}
