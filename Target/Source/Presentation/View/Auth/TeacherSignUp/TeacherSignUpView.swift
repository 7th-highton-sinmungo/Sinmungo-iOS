//
//  TeacherSignUpView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import PhotosUI

struct TeacherSignUpView: View {
    @Binding var isLogin: Bool
    @ObservedObject var viewModel = TeacherSignUpViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var imagePickerPresenting = false
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                Button {
                    imagePickerPresenting.toggle()
                } label: {
                    VStack {
                        if viewModel.profileImage.count <= 0 {
                            VStack {
                                Image(systemName: "camera")
                                    .foregroundColor(Color(.systemGray3))
                            }
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(
                                Circle()
                                    .stroke()
                                    .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                            )
                        }
                        else {
                            Image(uiImage: viewModel.profileImage[0].image)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 80, height: 80, alignment: .center)
                        }
                        
                        Text("프로필 사진")
                            .foregroundColor(Color(UIColor.systemBlue))
                            .font(.custom(SinmungoFontFamily.Roboto.regular.name, size: 15))
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("이름")
                    TextField("이름을 입력해주세요.", text: $viewModel.name)
                        .disableAutocorrection(true)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        )
                }
                
                VStack(alignment: .leading) {
                    Text("아이디")
                    TextField("아이디를 입력해주세요.", text: $viewModel.id)
                        .disableAutocorrection(true)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        )
                }
                
                VStack(alignment: .leading) {
                    Text("비밀번호")
                    SecureField("비밀번호 입력해주세요.", text: $viewModel.password)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke()
                                .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        )
                }
                
                Spacer()
                
                Button {
                    viewModel.apply(.signUpButtonDidTap)
                } label: {
                    Text("회원가입")
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
            .padding(.top, 20)

        }
        .navigate(to: ContentView(), when: $viewModel.isSuccess)
        .sheet(isPresented: $imagePickerPresenting, content: {
            ImagePicker(configuration: getConfiguration(), requests: $viewModel.profileImage)
        })
        .configureBackbutton(mode: mode)
        .onDisappear(perform: {
            viewModel.reset()
        })
        .onChange(of: viewModel.isSuccess, perform: { newValue in
            isLogin = newValue
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("교사 회원가입")
        .onChange(of: viewModel.profileImage) { value in
            print(value)
        }
    }
    
    func getConfiguration() -> PHPickerConfiguration {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = .images
        
        return configuration
    }
}

struct TeacherSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherSignUpView(isLogin: .constant(false))
    }
}
