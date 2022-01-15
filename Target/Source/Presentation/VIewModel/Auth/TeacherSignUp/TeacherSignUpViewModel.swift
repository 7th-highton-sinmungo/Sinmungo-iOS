//
//  TeacherSignUpViewModel.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import UIKit

final class TeacherSignUpViewModel: BaseViewModel{
    // MARK: - Properties
    @Published var name = ""
    @Published var id = ""
    @Published var password = ""
    @Published var profileImage: [UploadRequest] = []
    @Published var isSuccess = false
    
  
    private let imageRemote = ImageRemote()
    private let teacherRemote = TeacherRemote()
    
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
            teacherSignUp()
        }
    }
    
    private func teacherSignUp(){
        guard !id.isEmpty, !password.isEmpty, !name.isEmpty else {
            return
        }
        
        addCancellable(imageRemote.postUploadProfileImage([.init(type: .JPEG,
                                                                 name: "",
                                                                 image: profileImage.first?.image ?? .init())]))
        { [weak self] url in
            print(url)
            self?.addCancellable(self!.teacherRemote.postRegister(.init(id: self?.id ?? "",
                                                         password: self?.password ?? "",
                                                         name: self?.name ?? "",
                                                         profileImageUrl: url)), onReceiveValue: { _ in
                
                self?.isSuccess = true
            })
            
        }
    }
}
