//
//  OnboardingView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isLogin: Bool
    @State var isSignInActive = false
    @State var isStudentActive = false
    @State var isTeacherActive = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                
                Image(uiImage: SinmungoAsset.Assets.sinmungoLogo.image)
                                .resizable()
                                .frame(width: 183, height: 70)
                
                
                Spacer()
                
                Spacer()
                
                VStack(spacing: 15) {
                    NavigationLink(isActive: $isSignInActive) {
                        SignInView(isLogin: $isLogin)
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
                    
                    NavigationLink(isActive: $isStudentActive) {
                        StudentSignUpView(isLogin: $isLogin)
                    } label: {
                        Text("학생 회원가입")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(
                                Rectangle()
                                    .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                            )
                    }
                    .cornerRadius(8)

                    NavigationLink(isActive: $isTeacherActive) {
                        TeacherSignUpView(isLogin: $isLogin)
                    } label: {
                        Text("교사 회원가입")
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
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isLogin: .constant(false))
    }
}
