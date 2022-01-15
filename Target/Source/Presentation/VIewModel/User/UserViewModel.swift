//
//  UserViewModel.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var studentUser: StudentUser? = StudentUser(name: "뚱이", gcn: 2202, profileImageUrl:  "https://img.insight.co.kr/static/2020/08/12/700/fyzvinle3b068ce501hq.jpg")
    @Published var teacherUser: TeacherUser?
}
