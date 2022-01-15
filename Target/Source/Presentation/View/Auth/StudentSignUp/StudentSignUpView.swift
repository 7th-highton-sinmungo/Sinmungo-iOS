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
    @Binding var isLogin: Bool
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
                    HStack {
                        
                        gradeButton(grade: $viewModel.grade)
                        Spacer()
                        classButton(class: $viewModel.class)
                        Spacer()
                        numberButton(num: $viewModel.number)
                        
                    }
                    AuthTextField(title: "아이디", input: $viewModel.id)
                    AuthTextField(title: "비밀번호", input: $viewModel.password)
                }
                .padding(.horizontal, 24)
                
                Button {
                    viewModel.apply(.signUpButtonDidTap)
                    isLogin = true
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
        .navigate(to: ContentView(), when: $viewModel.isSuccess)
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
        StudentSignUpView(isLogin: .constant(false))
    }
}

struct gradeButton: View {
    @Binding var grade: Int

    var body: some View {
        Menu{
            ForEach(1..<4) { index in
                Button {
                    grade = index
                } label: {
                    Text("\(index)학년")
                }

            }
        } label: {
            VStack(alignment: .leading) {
                Text("학년")
                    .foregroundColor(.black)
                
                Text("\(grade)학년")
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(SinmungoAsset.Assets.sinmungoMain.color), lineWidth: 1)
                    )
                
            }
            
            
        }
    }
}

struct classButton: View {
    @Binding var `class`: Int
    
    var body: some View {
        Menu{
            ForEach(1..<9) { index in
                Button {
                    `class` = index
                } label: {
                    Text("\(index)반")
                }

            }
        } label: {
            VStack(alignment: .leading) {
                Text("반")
                    .foregroundColor(.black)
                Text("\(`class`)반")
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(SinmungoAsset.Assets.sinmungoMain.color), lineWidth: 1)
                    )
            }
            
            
        }
    }
}

struct numberButton: View {
    @Binding var num: Int
    
    var body: some View {
        Menu{
            ForEach(1..<21) { index in
                Button {
                    num = index
                } label: {
                    Text("\(index)번")
                }

            }
        } label: {
            VStack(alignment: .leading) {
                Text("반")
                    .foregroundColor(.black)
                Text("\(num)반")
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(SinmungoAsset.Assets.sinmungoMain.color), lineWidth: 1)
                    )
            }
        }
    }
}
