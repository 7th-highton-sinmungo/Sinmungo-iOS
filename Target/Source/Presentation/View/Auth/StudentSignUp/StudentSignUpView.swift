//
//  StudentSignUpView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import PhotosUI

struct StudentSignUpView: View {
    @ObservedObject var viewModel = StudentSignUpViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var imagePickerPresenting = false
    
    var body: some View {
        VStack {
            
            Button {
                imagePickerPresenting.toggle()
            } label: {
                VStack {
                    Image(uiImage: viewModel.profileImage.count <= 0 ? .init() : viewModel.profileImage[0].image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 82, height: 82)
                        .background(.gray)
                    .clipShape(Circle())
                    Text("프로필 사진")
                        .foregroundColor(Color(UIColor.systemBlue))
                        .font(.custom(SinmungoFontFamily.Roboto.regular.name, size: 15))
                }
               
            }
            
            VStack(spacing: 40) {
                VStack(spacing: 30) {
                    AuthTextField(title: "이름", input: $viewModel.name)
                    AuthTextField(title: "학번", input: $viewModel.gcn)
                    AuthTextField(title: "아이디", input: $viewModel.id)
                    AuthTextField(title: "비밀번호", input: $viewModel.password)
                }
                .padding(.horizontal, 24)
                
                Button {
                    viewModel.apply(.signUpButtonDidTap)
                } label: {
                    Text("회원가입")
                        .frame(width: UIFrame.width - 48, height: 62)
                        .background(Color(SinmungoAsset.Assets.sinmungoMain.color))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top, UIFrame.height*0.1)
            
            

        }
        .sheet(isPresented: $imagePickerPresenting, content: {
            ImagePicker(configuration: getConfiguration(), requests: $viewModel.profileImage)
        })
        .configureBackbutton(mode: mode)
        .onDisappear(perform: {
            viewModel.reset()
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("학생 회원가입")
    }
    
    func getConfiguration() -> PHPickerConfiguration {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = .images
        
        return configuration
    }
}

struct StudentSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        StudentSignUpView()
    }
}
