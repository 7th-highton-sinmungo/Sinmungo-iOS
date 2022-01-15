//
//  StudentSignUpView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct StudentSignUpView: View {
    @ObservedObject var viewModel = StudentSignUpViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Image("")
                .frame(maxWidth: 82, maxHeight: 82)
                .background(.gray)
                .clipShape(Circle())
            
            VStack(spacing: 30) {
                AuthTextField(title: "이름", input: $viewModel.name)
                AuthTextField(title: "학번", input: $viewModel.gcn)
                AuthTextField(title: "아이디", input: $viewModel.id)
                AuthTextField(title: "비밀번호", input: $viewModel.password)
            }
        }
        .navigationBarItems(leading: Button(action: {
            mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        }))
        .navigationTitle("학생 회원가입")
    }
}

struct StudentSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        StudentSignUpView()
    }
}
