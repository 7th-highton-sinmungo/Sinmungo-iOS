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
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("원하는 급식이 있나요?")
                    .font(.custom(SinmungoFontFamily.Roboto.regular.name, size: 27))
                
                Text("신문고에 공유해요")
                    .font(.custom(SinmungoFontFamily.Roboto.regular.name, size: 27))
            }
            .padding(.top, UIFrame.height * 0.0738)
            .padding(.horizontal, 20)
            
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("아이디")
                    TextField("아이디를 입력해주세요.", text: $viewModel.id)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        )
                }
                
                VStack(alignment: .leading) {
                    Text("비밀번호")
                    SecureField("비밀번호를 입력해주세요.", text: $viewModel.password)
                        .disableAutocorrection(true)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        )
                }
                
                Spacer()
                
                Button {
                    viewModel.apply(.signInButtonDidTap)
                } label: {
                    Text("로그인")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(
                            Rectangle()
                                .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        )
                }
                .cornerRadius(8)
            }
            .padding(.top, UIFrame.height * 0.0738)
        }
        .padding()
        .navigate(to: ContentView(), when: $viewModel.isSuccess)
        .configureBackbutton(mode: mode)
        .onChange(of: viewModel.isSuccess, perform: { newValue in
            isLogin = newValue
        })
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
