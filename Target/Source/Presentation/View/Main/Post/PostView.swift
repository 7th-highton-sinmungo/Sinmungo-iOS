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
    
    private let formatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "y년 M월 d일"
        
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 0) {
            ImageView(images: post.images)
                .frame(height: 210, alignment: .center)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(post.content)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        post.isLike ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    }
                    
                    Text("\(post.likeCount)")
                }
                
                Text(formatter.string(from: post.createdAt))
                    .foregroundColor(.secondary)
            }
            .padding(20)
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20.0)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(index: 0, content: "", createdAt: Date(), images: [""], likeCount: 0, isLike: true))
    }
}
