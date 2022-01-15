//
//  SignInView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @Binding var isLogin: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel = SignInViewModel()
    var body: some View {
        VStack {
            
            HStack {
                Text("안녕하세요\n앱이름 입니다.")
                    .foregroundColor(.black)
                    .font(.custom(SinmungoFontFamily.Roboto.regular.name, size: 27))
                Spacer()
            }
            .padding(.top, UIFrame.height*0.0738)
            .padding(.horizontal, 25)
            
            VStack(spacing: 40) {
                VStack(spacing: 30){
                    AuthTextField(title: "아이디", input: $viewModel.id)
                    AuthTextField(title: "비밀번호", input: $viewModel.password)
                }
                .padding(.horizontal, 24)
                
                Button {
                    viewModel.apply(.signInButtonDidTap)
                    isLogin = true
                } label: {
                    Text("로그인")
                        .frame(width: UIFrame.width - 48, height: 62)
                        .background(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top, UIFrame.height*0.0738)
            
            

            Spacer()
        }
        .configureBackbutton(mode: mode)
        .onDisappear(perform: {
            viewModel.reset()
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("로그인")
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(isLogin: .constant(false))
    }
}
