//
//  StudentSignUpVM.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import UIKit

final class StudentSignUpViewModel: BaseViewModel {
    // MARK: - Properties
    @Published var name = ""
    @Published var id = ""
    @Published var password = ""
    @Published var grade = 1
    @Published var `class` = 1
    @Published var number = 1
    @Published var profileImage: [UploadRequest] = []
    @Published var isSuccess = false
    
    deinit {
        bag.removeAll()
    }
    
    private let studentRemote = StudentRemote()
    private let imageRemote = ImageRemote()
    
    // MARK: - Input
    enum Input{
        case signUpButtonDidTap
    }
    
    func reset(){
        self.name = ""
        self.grade = 1
        self.class = 1
        self.number = 1
        self.id = ""
        self.password = ""
        self.profileImage = []
    }
    
    func apply(_ input: Input) {
        switch input{
        case .signUpButtonDidTap:
            studentSignUp()
        }
    }
    
    private func studentSignUp(){
        addCancellable(imageRemote.postUploadProfileImage([.init(type: .JPEG,
                                                                 name: "",
                                                                 image: profileImage.first?.image ?? .init())]))
        { [weak self] url in
            self?.addCancellable(self!.studentRemote.postLogin(.init(id: self?.id ?? "",
                                                         password: self?.password ?? "",
                                                         name: self?.name ?? "",
                                                         grade: self?.grade ?? 1,
                                                         classNum: self?.class ?? 1,
                                                         number: self?.number ?? 1,
                                                                     profileImageUrl: url)), onReceiveValue: { _ in
                self?.isSuccess = true
            })
        }

    }
    
}
