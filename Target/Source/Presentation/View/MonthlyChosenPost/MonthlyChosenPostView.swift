//
//  MonthlyChosenPost.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct MonthlyChosenPostView: View {
    @ObservedObject var viewModel = MonthlyChosenPostViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        
                        Spacer()
                        Button {
                            viewModel.apply(.plusDidTap)
                        } label: {
                            Image(systemName: "chevron.up")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 20, height: 12)
                        }
                        .padding(.trailing, 8)
                        
                        Button {
                            viewModel.apply(.minusDidTap)
                        } label: {
                            Image(systemName: "chevron.down")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 20, height: 12)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack {
                        ForEach(viewModel.posts, id: \.self) { post in
                            PostView(post: post, onApplyChoose: viewModel.onApplyChoose, onDeleteChoose: viewModel.onDeleteChoose, onApplyLike: viewModel.onApplyLike, onDeleteLike: viewModel.onDeleteLike, onDeletePost: viewModel.onDeletePost)
                        }
                    }
                    .padding()
                    
                }
            }
            .navigationTitle("\(viewModel.selectedDate.getMonth())월")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct MonthlyChosenPost_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyChosenPostView()
    }
}
