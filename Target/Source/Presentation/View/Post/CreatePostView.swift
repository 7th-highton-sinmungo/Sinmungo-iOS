//
//  CreatePostView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @StateObject var viewModel = CreatePostViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isActiveImagePicker = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                isActiveImagePicker.toggle()
            } label: {
                Text("사진 추가하기")
                Image(systemName: "chevron.right")
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    if viewModel.images.count <= 0 {
                        VStack {
                            Image(systemName: "exclamationmark.square")
                            Text("이미지를 선택해주세요.")
                        }
                        .foregroundColor(.secondary)
                        .frame(width: 300, height: 220, alignment: .center)
                    }
                    else {
                        HStack {
                            ForEach(viewModel.images, id: \.self) { image in
                                Image(uiImage: image.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 220, alignment: .center)
                                    .overlay(
                                        DeleteButtonOveray(image: image, images: $viewModel.images)
                                    )
                                    .clipped()
                            }
                            .padding(.trailing, 8)
                        }
                    }
                }
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("메뉴명")
                TextField("메뉴이름을 작성해주세요.", text: $viewModel.menuName)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("게시하기")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(
                        Rectangle()
                    )
            }
        }
        .configureBackbutton(mode: mode)
        .padding()
        .sheet(isPresented: $isActiveImagePicker) {
            ImagePicker(configuration: getConfiguration(), requests: $viewModel.images)
        }
        .navigationTitle("게시물 작성")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func getConfiguration() -> PHPickerConfiguration {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = .images
        
        if 3 - viewModel.images.count > 0 {
            configuration.selectionLimit = 3 - viewModel.images.count
        }
        
        return configuration
    }
}

struct DeleteButtonOveray: View {
    var image: UploadRequest
    @Binding var images: [UploadRequest]
    
    var gradient = LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .top,
            endPoint: .center)
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Rectangle().fill(gradient)
            
            Button {
                images.remove(at: images.firstIndex(of: image)!)
            } label: {
                Image(systemName: "xmark")
                    .padding(5)
                    .background(
                        Circle()
                            .foregroundColor(Color(.systemBackground))
                            .opacity(0.6)
                    )
            }
            .padding(10)
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
