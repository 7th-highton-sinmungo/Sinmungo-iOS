//
//  UserView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.studentUser {
                    StudentProfileView(user: user)
                        .padding(.horizontal)
                }
                else if let user = viewModel.teacherUser {
                    TeacherProfileView(user: user)
                        .padding(.horizontal)
                }
                
                List {
                    NavigationLink(destination: {
                        PreferredPostView()
                    }, label: {
                        Text("좋아요한 게시물 보기")
                    })
                    .padding()
                    
                    NavigationLink(destination: {
                        MyPostsView()
                    }, label: {
                        Text("내가 작성한 게시물 보기")
                    })
                    .padding()
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("내 정보")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
