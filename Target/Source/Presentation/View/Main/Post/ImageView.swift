//
//  ImageView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var images: [String]
    
    var body: some View {
        TabView {
            if images.count <= 0 {
                VStack {
                    Image(systemName: "xmark.square")
                    Text("이미지가 없습니다.")
                }
                .foregroundColor(.secondary)
                .tag(0)
            }
            else {
                ForEach(images.indices, id: \.self) { idx in
                    AsyncImage(url: URL(string: images[idx])) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else if phase.error != nil {
                            VStack {
                                Image(systemName: "exclamationmark.square")
                                Text("이미지를 불러올 수 없습니다.")
                            }
                            .foregroundColor(.secondary)
                        } else {
                            ProgressView()
                        }
                    }
                    .clipped()
                    .tag(idx)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(images: ["", ""])
    }
}
