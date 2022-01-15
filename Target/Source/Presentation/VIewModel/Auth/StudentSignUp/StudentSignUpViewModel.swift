//
//  StudentSignUpVM.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Combine
import UIKit

final class StudentSignUpViewModel: ObservableObject {
    // MARK: - Properties
    @Published var name = ""
    @Published var gcn = ""
    @Published var id = ""
    @Published var password = ""
    @Published var profileImage: [UploadRequest] = []
    @Published var selectedImage: [UploadRequest] = []
    
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
        case signUpButtonDidTap
        case profileImageDidSelect
    }
    
    func reset(){
        self.name = ""
        self.gcn = ""
        self.id = ""
        self.password = ""
        self.profileImage = []
        self.selectedImage = []
    }
    
    func apply(_ input: Input) {
        switch input{
        case .signUpButtonDidTap:
            break
        case .profileImageDidSelect:
            guard selectedImage.count <= 0 else {
                return
            }
            self.profileImage = selectedImage
        }
    }
    
    private func bindInput(){
        
    }
    // MARK: - Output
    private func bindOutput(){
        
    }
}
