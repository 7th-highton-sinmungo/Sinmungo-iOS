//
//  MyPostsView.swift
//  Sinmungo
//
//  Created by 최형우 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct MyPostsView: View {
    @StateObject var viewModel = MyPostsViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    SortButton(searchType: $viewModel.searchType)
                }
                .padding(.horizontal)
                
                ForEach(viewModel.posts, id: \.self) { post in
                    PostView(post: post)
                }
            }
            .padding()
        }
        .configureBackbutton(mode: mode)
        .navigationTitle("MY")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct MyPostsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostsView()
    }
}
