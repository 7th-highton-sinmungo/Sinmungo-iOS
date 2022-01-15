//
//  PreferredPostView.swift
//  Sinmungo
//
//  Created by 박세은 on 2022/01/15.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct PreferredPostView: View {
    @StateObject var viewModel = PreferredPostViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.posts, id: \.self) { post in
                    PostView(post: post)
                }
            }
            .padding()
        }
        .configureBackbutton(mode: mode)
        .navigationTitle("Preferred")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct PreferredPostView_Previews: PreviewProvider {
    static var previews: some View {
        PreferredPostView()
    }
}
