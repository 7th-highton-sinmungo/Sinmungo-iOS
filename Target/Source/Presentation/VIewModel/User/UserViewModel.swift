//
//  UserViewModel.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

class UserViewModel: BaseViewModel {
    @Published var studentUser: StudentUser?
    @Published var teacherUser: TeacherUser?
    
    let teacherRemote = TeacherRemote()
    let studentRemote = StudentRemote()
    
    override init() {
        super.init()
        fetchUser()
    }
    
    func fetchUser() {
        studentUser = nil
        teacherUser = nil
        if UserTypeController.getInstance().getUserType() == UserType.STUDENT {
            addCancellable(studentRemote.getUserInfo()) { [weak self] userInfo in
                self?.studentUser = userInfo
            }
        }
        else {
            addCancellable(teacherRemote.getUserInfo()) { [weak self] userInfo in
                self?.teacherUser = userInfo
            }
            
        }
    }
}
