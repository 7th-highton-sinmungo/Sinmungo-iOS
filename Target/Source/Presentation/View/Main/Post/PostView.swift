//
//  PostView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    var onApplyChoose: (Int) -> Void
    
    var onDeleteChoose: (Int) -> Void
    
    var onApplyLike: (Int) -> Void
    
    var onDeleteLike: (Int) -> Void
    
    var onDeletePost: (Int) -> Void
    
    private let stringFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter
    }()
    
    private let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "y년 M월 d일"
        
        return formatter
    }()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                ImageView(images: post.images)
                    .frame(height: 210, alignment: .center)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(post.content)
                        
                        Spacer()
                        
                        if post.isLike {
                            Button {
                                onDeleteLike(post.index)
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                            }
                        }
                        else {
                            Button {
                                onApplyLike(post.index)
                            } label: {
                                Image(systemName: "heart")
                                    .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                            }
                        }
                        
                        Text("\(post.likeCount)")
                    }
                    
                    HStack {
                        Text(dateFormatter.string(from: stringFormatter.date(from: post.createdAt) ?? Date()))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        if post.isMine {
                            Menu {
                                Button {
                                    onDeletePost(post.index)
                                } label: {
                                    Text("게시글 삭제")
                                    Image(systemName: "trash")
                                }
                            } label: {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding(20)
            }
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20.0)
            
            if UserTypeController.getInstance().getUserType() == UserType.TEACHER {
                if post.isChosen {
                    Button {
                        onDeleteChoose(post.index)
                    } label: {
                        Image(systemName: "checkmark.square.fill")
                            .font(.title)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(.systemBackground)))
                            .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                    }
                    .padding()
                }
                else {
                    Button {
                        onApplyChoose(post.index)
                    } label: {
                        Image(systemName: "checkmark.square")
                            .font(.title)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(.systemBackground)))
                            .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                    }
                    .padding()
                }
            }
            else {
                if post.isChosen {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .background(Circle().foregroundColor(Color(.systemBackground)))
                        .padding()
                        .foregroundColor(Color(SinmungoAsset.Assets.sinmungoMain.color))
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(index: 0, content: "", createdAt: "", images: [""], likeCount: 0, isLike: true, isChosen: false, isMine: false), onApplyChoose: {_ in }, onDeleteChoose: { _ in }, onApplyLike: {_ in }, onDeleteLike: {_ in}, onDeletePost: {_ in})
    }
}
