//
//  OnboardingView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @State var isSignInActive = false
    @State var isStudentActive = false
    @State var isTeacherActive = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                LogoView()
                Spacer()
                VStack(spacing: 20){
                    NavigationLink(isActive: $isSignInActive) {
                        SignInView()
                    } label: {
                        Text("로그인")
                            .frame(width: UIFrame.width - 48, height: 62)
                            .background(Color(SinmungoAsset.Assets.sinmungoGray.color))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(isActive: $isStudentActive) {
                        StudentSignUpView()
                    } label: {
                        Text("학생 회원가입")
                            .frame(width: UIFrame.width - 48, height: 62)
                            .background(Color(SinmungoAsset.Assets.sinmungoGray.color))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }

                    NavigationLink(isActive: $isTeacherActive) {
                        Text("교사 회원가입ㅁㄴㅇㄹ")
                    } label: {
                        Text("교사 회원가입")
                            .frame(width: UIFrame.width - 48, height: 62)
                            .background(Color(SinmungoAsset.Assets.sinmungoGray.color))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                }
                Spacer()
            }
            .navigationBarHidden(true)
            
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
